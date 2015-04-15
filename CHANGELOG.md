* Replaced `NSApplicationMain(C_ARGC, C_ARGV)` with `NSApplicationMain(Process.argc, Process.unsafeArgv)`

* Fixed methods that had methods whose parameters were of a different optionality to the protocol declaration (eg `applicationDidFinishLaunching`'s `NSApplication` parameter was declared as optional, and has now been changed to not be)

* Changed "`as`" to the new potentially-unsafe-downcast syntax "`as!`" when appropriate (such as when downcasting from `NSObject` to `CLLocation`)

* Changed `NSCalendarUnit.DayCalendarUnit` to `NSCalendarUnit.CalendarUnitDay`