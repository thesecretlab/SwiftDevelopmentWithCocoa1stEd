//
//  TableViewController.swift
//  iOSTableView
//
//  Created by Jon Manning on 6/08/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    // BEGIN ios_tableview_data
    var data = ["Once", "upon", "a", "time"]
    // END ios_tableview_data
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    // BEGIN ios_tableview_sections
    override func numberOfSectionsInTableView(tableView: UITableView)
        -> Int {
        return 1
    }
    // END ios_tableview_sections


    // BEGIN ios_tableview_rows
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    // END ios_tableview_rows

    // BEGIN ios_tableview_cells
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("StringCell",
                            forIndexPath: indexPath) as UITableViewCell

        let string = data[indexPath.row]

        cell.textLabel.text = string

        return cell
        
        
    }
    // END ios_tableview_cells
    
    
    /*
    // BEGIN ios_tableview_cells_example
    override func tableView(tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StringCell", 
    forIndexPath: indexPath) as UITableViewCell // <1>

        cell.textLabel.text = "Hello!" // <2>

        return cell // <3>
    }
    // END ios_tableview_cells_example
    */
    /*
    // BEGIN ios_tableview_cells_example2
    override func tableView(tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StringCell", 
    forIndexPath: indexPath) as UITableViewCell

        cell.textLabel.text = "Hello!"

        return cell
    }
    // END ios_tableview_cells_example2
    */
    // BEGIN ios_tableview_selected
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath
                            indexPath: NSIndexPath)  {
        println("Selected \(data[indexPath.row])")
    }
    // END ios_tableview_selected

}
