// Playground - noun: a place where people can play

import UIKit

// BEGIN creating_nsnumberformatter
let numberFormatter = NSNumberFormatter()
// END creating_nsnumberformatter

// BEGIN nsnumberformatter_currency
// Showing currency
numberFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
numberFormatter.stringFromNumber(23.42) // = "$23.42"
// END nsnumberformatter_currency

// BEGIN nsnumberformatter_rounding
// Round to the nearest 0.5
numberFormatter.roundingIncrement = 0.5
numberFormatter.stringFromNumber(23.42) // = "$23.50"
// END nsnumberformatter_rounding

numberFormatter.roundingIncrement = 0.0

// BEGIN nsnumberformatter_numbers
// Showing numbers
numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
numberFormatter.stringFromNumber(2003.42) // = "2,003.42"
// END nsnumberformatter_numbers

// BEGIN nsnumberformatter_percentages
// Showing percentages
numberFormatter.numberStyle = NSNumberFormatterStyle.PercentStyle
numberFormatter.stringFromNumber(0.95) // = "95%"
// END nsnumberformatter_percentages

// BEGIN nsenergyformatter_creating
let energyFormatter = NSEnergyFormatter()
// END nsenergyformatter_creating

// BEGIN nsenergyformatter_specific
// Formats the value, given in joules; uses a specific unit
energyFormatter.stringFromValue(5000,
    unit: NSEnergyFormatterUnit.Kilojoule) // = "5,000 kJ"
// END nsenergyformatter_specific

// BEGIN nsenergyformatter_automatic
// Formats the value, given in joules; automatically uses a locale-specific
// unit
energyFormatter.stringFromJoules(50000) // = "11.95 kcal"
// END nsenergyformatter_automatic

// BEGIN nsmassformatter_creating
let massFormatter = NSMassFormatter()
// END nsmassformatter_creating

// BEGIN nsmassformatter_specific
// Formats the value, given in kilograms; uses a specific unit
massFormatter.stringFromValue(0.5,
    unit: NSMassFormatterUnit.Kilogram) // = "0.5 kg"
// END nsmassformatter_specific

// BEGIN nsmassformatter_automatic
// Formats the value, given in meters; automatically uses a locale-specific
// unit
massFormatter.stringFromKilograms(0.5) // = "1.1 lb"
// END nsmassformatter_automatic

// BEGIN nslengthformatter_creating
let lengthFormatter = NSLengthFormatter()
// END nslengthformatter_creating

// BEGIN nslengthformatter_specific
// Formats the value, given in meters; uses a specific unit
lengthFormatter.stringFromValue(42.3,
    unit: NSLengthFormatterUnit.Meter) // = "42.3 m"
// END nslengthformatter_specific

// BEGIN nslengthformatter_automatic
// Formats the value, given in meters; automatically uses a locale-specific
// unit
lengthFormatter.stringFromMeters(42.3) // = "46.259 yd"
// END nslengthformatter_automatic

// BEGIN nsbytecountformatter
let dataFormatter = NSByteCountFormatter()
// END nsbytecountformatter

// BEGIN nsbytecountformatter_formatting
// Formats the value, given in bytes
dataFormatter.stringFromByteCount(200000) // = "200 KB"
// END nsbytecountformatter_formatting

// BEGIN nsbytecountformatter_countstyle
// Count style can be changed; defaults to decimal (2,000 bytes = 2KB)
// Setting this to Binary makes it treat 2,048 = 2KB
dataFormatter.countStyle = NSByteCountFormatterCountStyle.Binary
dataFormatter.stringFromByteCount(200000) // = "195 KB"
// END nsbytecountformatter_countstyle

// BEGIN nsbytecountformatter_zero
// Also formats zero bytes intelligently, as a word
dataFormatter.stringFromByteCount(0) // = "Zero KB"
// END nsbytecountformatter_zero
