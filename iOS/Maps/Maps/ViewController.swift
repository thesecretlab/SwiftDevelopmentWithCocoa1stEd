//
//  ViewController.swift
//  Maps
//
//  Created by Timothy Rodney Nugent on 25/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import UIKit
// ------
// maps setup
// BEGIN maps_setup
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {
                            
    @IBOutlet weak var mapView: MKMapView!
// END maps_setup
// ------
// centering the map
// BEGIN maps_centre
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self;
        let center = CLLocationCoordinate2DMake(-37.813611, 144.963056)
        let span = MKCoordinateSpanMake(2, 2);
        self.mapView.region = MKCoordinateRegionMake(center, span)
// END maps_centre
// ------
// adding a pin
// BEGIN maps_annotation
        // creating an new annotation
        var annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "Melbourne"
        annotation.subtitle = "Victoria"
        // adding the annotation to the map
        self.mapView.addAnnotation(annotation);
// END maps_annotation
// ------
// adding a circle overlay
// BEGIN maps_overlay
        // creating and adding a new circle overlay to the map
        var overlay = MKCircle(centerCoordinate: center, radius: 50000)
        self.mapView.addOverlay(overlay)
// END maps_overlay
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// ------
// creating a render for the circle overlay
// BEGIN maps_render
    func mapView(
        mapView: MKMapView!, rendererForOverlay
        overlay: MKOverlay!) -> MKOverlayRenderer! {
        if (overlay.isKindOfClass(MKCircle))
        {
            var circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.strokeColor = UIColor.greenColor()
            circleRenderer.fillColor = UIColor(
                red: 0,
                green: 1.0,
                blue: 0,
                alpha: 0.5)
            
            return circleRenderer
        }
        return nil
    }
// END maps_render
}

