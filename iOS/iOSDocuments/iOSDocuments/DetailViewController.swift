//
//  DetailViewController.swift
//  iOSDocuments
//
//  Created by Jon Manning on 7/08/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

// BEGIN ios_documents_detailviewcontroller
import UIKit

class DetailViewController: UIViewController, UITextViewDelegate {
                            
    @IBOutlet weak var textView: UITextView!

    @IBAction func done(sender: AnyObject) {
        if let document : SampleDocument = self.detailItem {
            document.saveToURL(document.fileURL,
                forSaveOperation: UIDocumentSaveOperation.ForOverwriting)
            {
                (success) in
                
                self.navigationController?.popViewControllerAnimated(true)
                
                return
            }
        }
    }
    
    var detailItem: SampleDocument? {
        didSet {
            self.configureView()
        }
    }

    func configureView() {
        if let document: SampleDocument = self.detailItem {
            self.textView?.text = document.text
        }
    }
    
    func textViewDidChange(textView: UITextView!) {
        if let document : SampleDocument = self.detailItem {
            document.text = self.textView.text
            document.updateChangeCount(UIDocumentChangeKind.Done)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        
        self.navigationItem.hidesBackButton = true
    }
    
    
}
// END ios_documents_detailviewcontroller

