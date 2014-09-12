//
//  main.swift
//  CommandLine
//
//  Created by Jon Manning on 23/06/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

// BEGIN commandline_app
import Foundation

for var i = 10; i > 0; i-- {
    NSLog("%i green bottles, standing on the wall", i);
    NSLog("%i green bottles, standing on the wall", i);
    NSLog("And if one green bottle should accidentally fall");
    NSLog("There'll be %i green bottles, standing on the wall\n\n", i-1);
}
// END commandline_app
