//
//  ViewController.swift
//  Fonterator
//
//  Created by Sam Youtsey on 8/25/14.
//  Copyright (c) 2014 Nebari. All rights reserved.
//

import UIKit

class FontFamiliesTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var familesArray = [String]()
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        familesArray = UIFont.familyNames() as [String]
        sort(&familesArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        //
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "font-cell")
        let familyName = familesArray[indexPath.row]
        var familyMembers = UIFont.fontNamesForFamilyName(familyName) as [String]

        let font = UIFont(name: familyMembers[0], size: UIFont.systemFontSize())
        cell.textLabel.text = familyName
        cell.textLabel.font = font
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return familesArray.count
    }

    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var fontMembersTableViewController = FontMembersTableTableViewController(style: .Plain)
        fontMembersTableViewController.initFontFamily(familesArray[indexPath.row])
        
        self.navigationController.pushViewController(fontMembersTableViewController, animated: true)
    }

}