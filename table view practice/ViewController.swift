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

}

