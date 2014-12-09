// Playground - noun: a place where people can play

import Cocoa

// BEGIN json_creating_example
let dictionary = ["One": 1, "Two":2]

var error : NSError? = nil

let serializedData = NSJSONSerialization.dataWithJSONObject(dictionary,
    options: NSJSONWritingOptions(), error: &error)

// After this call, 'serializedData' is either nil or full of JSON data.
// If there was a problem, the 'error' variable is set to point to an
// NSError object that describes the problem.
// END json_creating_example

// BEGIN json_loading_example
let loadedDictionary =
    NSJSONSerialization.JSONObjectWithData(serializedData,
        options: NSJSONReadingOptions(), error: &error) as? [String:Int]

// loadedDictionary is now either a dictionary that maps
// strings to ints, or is nil
// END json_loading_example
