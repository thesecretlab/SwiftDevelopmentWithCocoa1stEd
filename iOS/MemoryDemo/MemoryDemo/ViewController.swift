//
//  ViewController.swift
//  MemoryDemo
//
//  Created by Jon Manning on 9/07/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit

// BEGIN class_conform_to_protocol
class ViewController: UIViewController, UIScrollViewDelegate {
// END class_conform_to_protocol
    
    @IBOutlet var imagesContainer: UIScrollView!
    
    /*
    // This version of viewDidLoad crashes the app.
    // BEGIN view_did_load
    override func viewDidLayoutSubviews ()  {
        
        // Create 10,000 images
        let pageCount = 10000
        
        // Load them into the scroll view
        for i in 1...pageCount {
            self.loadPageWithNumber(i)
        }
        
        // Tell the scroll view about its new content size
        var contentSize = CGSize()
        contentSize.height = self.imagesContainer.bounds.size.height
        contentSize.width = self.imagesContainer.bounds.size.width 
            * CGFloat(pageCount)
        
        self.imagesContainer.contentSize = contentSize
    }
    // END view_did_load
    */
    
    // This version of viewDidLoad works correctly.
// BEGIN view_did_load_v2
override func viewDidLayoutSubviews ()  {
        
    // Create 10,000 images
    let pageCount = 10000
        
    self.updatePages();
        
    // Tell the scroll view about its new content size
    var contentSize = CGSize()
    contentSize.height = self.imagesContainer.bounds.size.height
    contentSize.width = self.imagesContainer.bounds.size.width
    * CGFloat(pageCount)
        
    self.imagesContainer.contentSize = contentSize
}
// END view_did_load_v2

    
    // BEGIN image_drawing_func
    func imageWithNumber(number: Int) -> UIImage {
    
        // Inset the image by 30px so that we can see the rounded corners
        var imageRect = self.imagesContainer.frame
        imageRect.inset(dx: 30, dy: 30)
        
        UIGraphicsBeginImageContext(imageRect.size)
        
        // Draw a rounded rectangle
        let path = UIBezierPath(roundedRect: imageRect, cornerRadius: 10)
        
        path.lineWidth = 20
        
        UIColor.darkGrayColor().setStroke()
        UIColor.lightGrayColor().setFill()
        
        path.fill()
        path.stroke()
        
        // Draw the number
        let label = "\(number)"
        
        let font = UIFont.systemFontOfSize(50)
        let labelPoint = CGPoint(x: 50, y: 50)
        
        UIColor.whiteColor().setFill()
        
        let labelAttributes = [NSFontAttributeName: font]
        label.drawAtPoint(labelPoint, withAttributes:labelAttributes)
        
        // Get the finished image and return it
        let returnedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return returnedImage
    }
    // END image_drawing_func
    
    // BEGIN load_page_with_number
    func loadPageWithNumber(number:NSInteger) {
        
        // If an image view already exists for this page, don't do anything
        if self.imagesContainer.viewWithTag(number) != nil {
            return
        }
        
        // Get the image for this page
        let image = self.imageWithNumber(number)
        
        // Create and prepare the image view for this page
        let imageView = UIImageView(image: image)
        var imageViewFrame = self.imagesContainer.bounds
        imageViewFrame.origin.x = imageViewFrame.size.width * CGFloat(number - 1)
        imageView.frame = imageViewFrame
        
        // Add it to the scroll view
        self.imagesContainer.addSubview(imageView)
        
        // Mark this new image view with a tag so that we can
        // easily refer to it later
        imageView.tag = number
    }
    // END load_page_with_number

// BEGIN update_pages
func updatePages() {
        
    var pageNumber = Int(imagesContainer.contentOffset.x /
    imagesContainer.bounds.size.width + 1)
        
    // Load the image previous to this one
    self.loadPageWithNumber(pageNumber - 1)
        
    // Load the current page
    self.loadPageWithNumber(pageNumber)
        
    // Load the next page
    self.loadPageWithNumber(pageNumber+1)
        
    // Remove all image views that aren't on
    // this page or the pages adjacent to it
    for imageView in imagesContainer.subviews {
        if imageView.tag < pageNumber - 1 ||
            imageView.tag > pageNumber + 1 {
            imageView.removeFromSuperview()
        }
    }
}
// END update_pages

// BEGIN scrollview_did_scroll
func scrollViewDidScroll(scrollView: UIScrollView)  {
    self.updatePages()
}
// END scrollview_did_scroll


}

