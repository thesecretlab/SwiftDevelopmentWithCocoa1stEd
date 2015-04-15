//
//  ViewController.swift
//  iDeviceBeacon
//
//  Created by Tim Nugent on 25/08/2014.
//  Copyright (c) 2014 Tim Nugent. All rights reserved.
//

import UIKit
// ------
// iBeacon setup
// BEGIN ibeacon_setup
import CoreLocation
import CoreBluetooth

class ViewController: UIViewController,CBPeripheralManagerDelegate{
    var bluetoothManager : CBPeripheralManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bluetoothManager = CBPeripheralManager(delegate: self, queue: nil)
    }
// END ibeacon_setup

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func meaninglessMethodForTheBookLinking()
    {
// ------
// iBeacon region
// BEGIN ibeacon_region
        // the UUID string was generated using the uuidgen command
        let uuid = NSUUID(UUIDString:"F7769B0E-BF97-4485-B63E-8CE121988EAF")
        
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid,
            major: 1,
            minor: 2,
            identifier: "Awesome painting");
// END ibeacon_region
    }

// ------
// iBeacon configuration
// BEGIN ibeacon_config
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {
        
        if (self.bluetoothManager?.state == CBPeripheralManagerState.PoweredOn)
        {
            // the UUID string was generated using the uuidgen command
            let uuid = NSUUID(UUIDString:"F7769B0E-BF97-4485-B63E-8CE121988EAF")
            
            let beaconRegion = CLBeaconRegion(proximityUUID: uuid,
                major: 1,
                minor: 2,
                identifier: "Awesome painting");
            
            var beaconData = beaconRegion.peripheralDataWithMeasuredPower(nil)
            
            
            self.bluetoothManager?.startAdvertising(beaconData as [NSObject:AnyObject])
            
        }
    }
// END ibeacon_config
}

