//
//  ViewController.swift
//  TextKitDemo
//
//  Created by Jon Manning on 31/07/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

// BEGIN textkit-example
import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var textView: UITextView!
    
    var observer : AnyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textView.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        
        
        observer = NSNotificationCenter.defaultCenter().addObserverForName(UIContentSizeCategoryDidChangeNotification, object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification) in
            
            self.textView.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
            
        })
    }

    
}
// END textkit-example
