// Playground - noun: a place where people can play

import Foundation

// BEGIN basic_url
let myURL = NSURL(string: "http://oreilly.com")
// END basic_url

// BEGIN relative_url
let relativeURL = NSURL(string: "resources/index.html",
    relativeToURL: NSURL(string: "http://oreilly.com/"))
// END relative_url

// BEGIN host_from_url
let host = relativeURL?.host // = "oreilly.com"
// END host_from_url

// BEGIN file_url
let myFileURL = NSURL(fileURLWithPath:"/Applications/")
// END file_url

// BEGIN url_request
let urlRequest = NSURLRequest(URL:myURL!)
// END url_request

// BEGIN mutable_url_request
let mutableRequest = NSMutableURLRequest(URL: myURL!)
mutableRequest.HTTPMethod = "POST"
// END mutable_url_request
