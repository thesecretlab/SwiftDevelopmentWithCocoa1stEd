//
//  TestExamplesTests.swift
//  TestExamplesTests
//
//  Created by Jon Manning on 30/08/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit
import XCTest

class TestExamplesTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    // BEGIN test_addition
    func testAddition() {
        XCTAssertEqual(2 + 2, 4, "2 + 2 should equal 4")
    }
    // END test_addition
    
    func doSomethingUseful(completion : () -> Void) {
        completion()
    }
    
    // BEGIN test_expectation
    func testExpectations() {
        
        let openExpectation = self.expectationWithDescription("Something useful happened");
        
        // Perform some work that might take a bit of time
        // (This example method takes a block that runs when the work is done)
        doSomethingUseful { () -> Void in
            
            // The work is now done, fulfill the expectation
            openExpectation.fulfill()
        }
        
        // Now that the work has been kicked off, wait 1 second for the 
        // expectation to be fulfilled
        self.waitForExpectationsWithTimeout(1.0) { (error) in
            
            println("The expectation wasn't fulfilled in time! \(error)")
            
        }
        
        
    }
    // END test_expectation

    // BEGIN test_performance
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            
            // Do some useful work; this block will be run multiple times, and
            // the time taken to run it will be measured.
            
        }
    }
    // END test_performance

    
}
