//
//  FontMembersTableTableViewController.swift
//  Fonterator
//
//  Created by Sam Youtsey on 8/25/14.
//  Copyright (c) 2014 Nebari. All rights reserved.
//

import UIKit

class FontMembersTableTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    var family: String?
    var membersArray: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView!.allowsSelection = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initFontFamily(family: String) {
        
        self.family = family
        membersArray = UIFont.fontNamesForFamilyName(family) as? [String]
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        return self.membersArray!.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "font-cell")
        let fontString = membersArray![indexPath.row]
        
        let font = UIFont(name: fontString, size: UIFont.systemFontSize())
        cell.textLabel.font = font
        cell.textLabel.text = fontString
        
        return cell
    }

}
