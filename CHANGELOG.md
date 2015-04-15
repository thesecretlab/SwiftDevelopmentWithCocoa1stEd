There are several changes from Xcode 6.2 to 6.3 that affect the Swift language, as well as its standard library. We've updated the code in this repository to bring it up to date, but this means that the code in the book doesn't line up with the code in the repo.

The main changes are:

* `NSApplicationMain(C_ARGC, C_ARGV)` has been replaced with `NSApplicationMain(Process.argc, Process.unsafeArgv)`.

* Several methods that were implementations of protocols had the optionality of their parameters changed. For example, the `applicationDidFinishLaunching` parameter originally had a parameter of type `NSApplication!`, which has now changed to `NSApplication`.

* Several properties changed from being optional to non-optional, or vice-versa.

* Swift now has a "forced cast" operator, `as!`, which is used when down-casting from a class. We've update the code to use `as!` when appropriate (such as when downcasting from `NSObject` to `CLLocation`)

* Changed `NSCalendarUnit.DayCalendarUnit` (which was deprecated) to `NSCalendarUnit.CalendarUnitDay`.

* Changed "countElements" to its new replacement, "count".