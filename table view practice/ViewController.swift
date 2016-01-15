//
//  ViewController.swift
//  table view practice
//
//  Created by edejesu on 1/13/16.
//  Copyright © 2016 edejesu. All rights reserved.
//

import UIKit
//bring in data source and delegate protocalls for tableview

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    var superheros = ["batman", "superman", "aquaman", "wonderwoman", "the flash", "the dirty bubble"]
    var realNames = ["brunce wayne", "clark kent", "authur curry", "dianna", "barry allen", "brown bubble"]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // set tablesource data source & delegate to view controller
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    //allows you to add a new superhero to tableview
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "add superhero", message: nil, preferredStyle: .Alert)
        //way to attach an action to the alert
        // makes spaces to tpye w placeholder text
        myAlert.addTextFieldWithConfigurationHandler
        {
        (nameTextfield) -> Void in
            nameTextfield.placeholder = "add superhero name"
        }
        myAlert.addTextFieldWithConfigurationHandler
        {
        (aliasTextfield) -> Void in
        aliasTextfield.placeholder = "add alias superhero name"
        }
        //adds cancel button
    var cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        //add action to alert
    var addAction = UIAlertAction(title: "add", style: .Default)
        { (addAction) -> Void in
            let superheroTF = myAlert.textFields![0] as UITextField
            let aliasTF = myAlert.textFields![1] as UITextField
            self.superheros.append(superheroTF.text!)
            self.realNames.append(aliasTF.text!)
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)

    //presents alert view
        self.presentViewController (myAlert, animated: true, completion: nil)
    }
    //required for tableivew protocall - sends data to cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //creates a cell variable for the tableview
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        //sets text on the cell
        myCell.textLabel?.text = superheros[indexPath.row]
        myCell.detailTextLabel?.text = realNames[indexPath.row]
        return myCell
    }
    //required for tableview protocall - sets number of rows in table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superheros.count
    }
    //removing an item from the tableview/ array
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            superheros.removeAtIndex(indexPath.row)
            //removes from first array
            realNames.removeAtIndex(indexPath.row)
            //removes from second array
            myTableView.reloadData()
            //reloads everything
        }
    }
}

