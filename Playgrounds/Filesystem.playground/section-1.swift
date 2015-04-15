// Playground - noun: a place where people can play

import Cocoa

// BEGIN getting_filemanager
let fileManager = NSFileManager.defaultManager()
// END getting_filemanager

/*
// BEGIN filemanager_with_delegate
let fileManager = NSFileManager()

// we can now set a delegate on this new file manager to be
// notified when operations are complete
fileManager.delegate = self
// END filemanager_with_delegate
*/

if(true) {
// BEGIN listing_directory
let folderURL = NSURL.fileURLWithPath("/Applications/")

var error : NSError? = nil

let folderContents = fileManager.contentsOfDirectoryAtURL(folderURL!,
    includingPropertiesForKeys:nil, options:NSDirectoryEnumerationOptions(),
    error:&error)
// END listing_directory

let anURL = folderContents?[0] as! NSURL

// BEGIN getting_file_info
// anURL is an NSURL object

// Pass in an array containing the attributes you want to know about
let attributes = [NSURLFileSizeKey, NSURLContentModificationDateKey]

// In this case, we don't care about any potential errors, so we
// pass in 'nil' for the error parameter.
let attributesDictionary = anURL.resourceValuesForKeys(attributes, error: nil)

// We can now get the file size out of the dictionary:
let fileSizeInBytes = attributesDictionary?[NSURLFileSizeKey] as! NSNumber

// And the date it was last modified:
let lastModifiedDate =
    attributesDictionary?[NSURLContentModificationDateKey] as! NSDate
// END getting_file_info
}
/*
// BEGIN prefetching_attributes
let attributes = 
    [NSURLFileSizeKey, NSURLContentModificationDateKey]
fileManager.contentsOfDirectoryAtURL(folderURL,
    includingPropertiesForKeys: attributes,
    options: NSDirectoryEnumerationOptions(), error: nil)
// END prefetching_attributes
*/

// BEGIN temporary_directory
let temporaryDirectoryPath = NSTemporaryDirectory()
// END temporary_directory

// BEGIN creating_directory
let newDirectoryURL  = NSURL.fileURLWithPath(temporaryDirectoryPath +
    "/MyNewDirectory")

var error : NSError? = nil
var didCreate = fileManager.createDirectoryAtURL(newDirectoryURL!,
    withIntermediateDirectories: false, attributes: nil, error: &error)
if (didCreate) {
    // The directory was successfully created
} else {
    // The directory wasn't created (maybe one already exists at the path?)
    // More information is stored in the 'error' variable
}
// END creating_directory


let newFileURL = newDirectoryURL?.URLByAppendingPathComponent("MyNewFile.txt")
let newFileData = "Hello!".dataUsingEncoding(NSUTF8StringEncoding,
    allowLossyConversion: false)
let newFilePath = newFileURL!.path

// BEGIN creating_file
// Note that the first parameter is the path (as a string), NOT an NSURL!
fileManager.createFileAtPath(newFilePath!,
    contents: newFileData,
    attributes: nil)
// END creating_file

let sourceURL = newFileURL
let destinationURL = newDirectoryURL!.URLByAppendingPathComponent("MyNewFile2.txt")

// BEGIN copying_file
fileManager.copyItemAtURL(sourceURL!, toURL: destinationURL, error: nil)
// END copying_file

// BEGIN moving_file
fileManager.moveItemAtURL(sourceURL!, toURL: destinationURL, error: nil)
// END moving_file


// BEGIN removing_file
fileManager.removeItemAtURL(newFileURL!, error: nil)
// END removing_file

// BEGIN getting_document_directory
let URLs = fileManager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory,
    inDomains: NSSearchPathDomainMask.UserDomainMask) as! [NSURL]

let documentURL = URLs[0]
// END getting_document_directory

// BEGIN getting_file_name_in_documents_directory
let fileURL = documentURL.URLByAppendingPathComponent("Example.txt")
// END getting_file_name_in_documents_directory

// BEGIN open_panel
let panel = NSOpenPanel()

panel.canChooseDirectories = true
panel.canChooseFiles = false

panel.beginWithCompletionHandler() {
    (result : Int) in
    
    let theURL = panel.URL
    
    // Do something with the URL that the user selected;
    // we now have permission to work with this location
}
// END open_panel

let selectedURL = NSURL()

// BEGIN creating_security_scoped_bookmark
// Get the location in which to put the bookmark;
// documentURL is determined by asking the NSFileManager for the
// user's documents folder; see earlier in this chapter
var bookmarkStorageURL =
    documentURL.URLByAppendingPathComponent("savedbookmark.bookmark")

// selectedURL is a URL that the user has selected using an NSOpenPanel
let bookmarkData = selectedURL.bookmarkDataWithOptions(
    NSURLBookmarkCreationOptions.WithSecurityScope,
    includingResourceValuesForKeys: nil, relativeToURL: nil, error: nil)

// Save the bookmark data
bookmarkData?.writeToURL(bookmarkStorageURL, atomically: true)
// END creating_security_scoped_bookmark


// BEGIN loading_security_scoped_bookmark
let loadedBookmarkData = NSData(contentsOfURL: bookmarkStorageURL)

var loadedBookmark : NSURL? = nil

if loadedBookmarkData?.length > 0 {
    var isStale = false
    var error : NSError? = nil
    
    loadedBookmark = NSURL(byResolvingBookmarkData:loadedBookmarkData!,
        options: NSURLBookmarkResolutionOptions.WithSecurityScope,
        relativeToURL: nil, bookmarkDataIsStale: nil, error: nil)
    
    // We can now use this file
    
}
// END loading_security_scoped_bookmark

