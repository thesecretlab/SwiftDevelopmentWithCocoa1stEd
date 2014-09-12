// Playground - noun: a place where people can play

import UIKit

// BEGIN closure_example
let aClosure : Void -> Int = { return 1 }

aClosure() // returns 1
// END closure_example


let aViewController = UIViewController()
var anotherViewController = UIViewController()

// BEGIN completionhandler
// In this code, aViewController and anotherViewController are both UIViewControllers.

// Slide up a view controller, and then when the slide animation is
// finished, change its background color to yellow.

aViewController.presentViewController(anotherViewController, animated: true) {
    // This closure is run after the animation is finished
    anotherViewController.view.backgroundColor = UIColor.yellowColor()
}
// END completionhandler

// BEGIN filtering
// Filter an array of strings down to only strings that begin with the word
// "Apple"
let array = ["Orange", "Apple", "Apple Juice"]
let filteredArray = array.filter() {
    return $0.hasPrefix("Apple")
}
// filteredArray now contains "Apple", "Apple Juice"
// END filtering


// In order to reuse variables, stick each example in its own closure
var context1 : Void -> Void = {
    // BEGIN operation_queue
    var mainQueue = NSOperationQueue.mainQueue()
    
    mainQueue.addOperationWithBlock() {
        // Add code here
    }
    // END operation_queue
}

var context2 : Void -> Void = {
    // BEGIN different_queues
    // Getting the main queue (will run on the main thread)
    var mainQueue = NSOperationQueue.mainQueue()
    
    // Creating a new queue (will run on a background thread, probably)
    var backgroundQueue = NSOperationQueue()
    // END different_queues
    
    // BEGIN operations_on_queues
    mainQueue.addOperationWithBlock() {
        println("This operation ran on the main queue!")
    }
    
    backgroundQueue.addOperationWithBlock() {
        println("This operation ran on another queue!")
    }
    // END operations_on_queues
    
    // BEGIN scheduling_on_main_queue_from_background
    backgroundQueue.addOperationWithBlock() {
        // Do some work in the background
        println("I'm on the background queue")
        
        // Schedule a block on the main queue
        mainQueue.addOperationWithBlock() {
            println("I'm on the main queue")
            // GUI work can safely be done here.
        }
    }
    // END scheduling_on_main_queue_from_background
    
    
    
}

