//
//  ViewController.swift
//  OperationQueues
//
//  Created by Jon Manning on 30/06/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,
    UITableViewDataSource
{
    
    // BEGIN hosts_property
    let hosts = ["google.com", "apple.com", "secretlab.com.au",
        "oreilly.com", "yahoo.com", "twitter.com", "facebook.com"]
    // END hosts_property
    
    // BEGIN queue_property
    let queue = NSOperationQueue()
    // END queue_property
    
    // BEGIN table_view_stuff
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int  {
        return 1
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int  {
        return hosts.count
    }
    // END table_view_stuff
    
    // BEGIN cell_configuration
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell  {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("FaviconCell")
                                                        as FaviconTableViewCell
        
        var host = hosts[indexPath.row]
        var url = NSURL(string: "http://\(host)/favicon.ico")
        
        cell.operationQueue = queue
        cell.url = url
        
        return cell
        
    }
    // END cell_configuration


}

