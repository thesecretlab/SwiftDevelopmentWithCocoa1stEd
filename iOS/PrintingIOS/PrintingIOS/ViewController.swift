//
//  ViewController.swift
//  PrintingIOS
//
//  Created by Timothy Rodney Nugent on 25/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var textView: UITextView!

// ------
// printer function
// BEGIN print_func
    @IBAction func print(sender: AnyObject) {
        var printInteraction =
                UIPrintInteractionController.sharedPrintController()
        
        var textFormatter =
            UISimpleTextPrintFormatter(text: self.textView.text)
        printInteraction?.printFormatter = textFormatter
        
        printInteraction?.presentAnimated(true,
            completionHandler: {
                (printController:UIPrintInteractionController!,
                completed:Bool!,
                error:NSError!) -> Void in
        })
    }
// END print_func
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

