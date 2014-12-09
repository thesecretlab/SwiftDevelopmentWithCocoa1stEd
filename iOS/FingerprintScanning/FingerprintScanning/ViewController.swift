//
//  ViewController.swift
//  FingerprintScanning
//
//  Created by Jon Manning on 21/09/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit


// BEGIN import_auth
import LocalAuthentication
// END import_auth

class ViewController: UIViewController {
    
    // BEGIN auth_context
    let authenticationContext = LAContext()
    // END auth_context

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func authenticate(sender: AnyObject) {
        
        // BEGIN check_policy
        // Specify how we want to authenticate. (As of iOS 8.0, the only option
        // is with the Touch ID biometric fingerprint scanner.)
        
        let policy = LAPolicy.DeviceOwnerAuthenticationWithBiometrics
        
        // Ask the system if it's possible for this authentication check to
        // succeed. (The device might not have a fingerprint scanner, or 
        // the user may not have enrolled their fingerprints, for example.)
        var error : NSError? = nil
        
        let canAuthenticate =
            authenticationContext.canEvaluatePolicy(policy, error: &error)
        
        if canAuthenticate == false {
            // If we can't use it, bail out and present an alternative way of
            // authenticating.
            println("Can't use the authentication system! \(error)")
            return
        }
        // END check_policy

        // BEGIN eval_policy
        // Explain why they need to authenticate; for example:
        let authenticationReason = "You're about to spend money."
        
        // Fire off the authenticator!
        authenticationContext.evaluatePolicy(policy,
            localizedReason: authenticationReason) {
                (succeeded, error) -> Void in
            
            if succeeded {
                
                // We're in! Go ahead and perform the sensitive transaction.
                
                println("Authenticated!")
                
            } else {
                
                // Didn't work! This can happen for a number of reasons,
                // including the user canceling an incoming phone call, 
                // or choosing to enter a password instead.
                
                // Check the error code in the 'error' variable to determine
                // what the app should do next.
                
                println("Not authenticated! \(error)")
                
                // Some possible error codes:
                if error.code == LAError.UserFallback.rawValue {
                    // The user decided to enter a password instead of scanning
                    // her fingerprint; present a different way to authenticate.
                }
                
                if error.code == LAError.UserCancel.rawValue {
                    // The user cancelled authentication.
                }
            }
            
        }
        // END eval_policy
        
    }
    
}

