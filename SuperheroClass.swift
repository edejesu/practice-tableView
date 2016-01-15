//
//  SuperheroClass.swift
//  table view practice
//
//  Created by edejesu on 1/15/16.
//  Copyright © 2016 edejesu. All rights reserved.
//

import UIKit

class SuperheroClass: NSObject
{
    var name = ""
    var alias = ""
    var power = 0
    var image = UIImage(named: "default")
    
    init(Name: String, Alias: String, Power: Int, Image: UIImage)
    {
        super.init()
        name = Name
        alias = Alias    //for next screen
        power = Power
        image = Image
    }
    init(Name: String, Alias: String)
    {
        super.init()
        name = Name  // for add screen
        alias = Alias
    }

}
