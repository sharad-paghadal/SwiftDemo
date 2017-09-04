//
//  ViewController.swift
//  MapKitDemo
//
//  Created by Sharad Paghadal on 26/10/16.
//  Copyright © 2016 Sharad Paghadal. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    var location = CLLocationCoordinate2D(
        latitude: 	21.233155,
        longitude: 72.86403349999999
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
 

        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
                let span = MKCoordinateSpanMake(0.05, 0.05)
                let region = MKCoordinateRegion(center: location, span: span)
                mapView.setRegion(region, animated: true)
        
                let annotation = MKPointAnnotation()
                annotation.coordinate = location
                annotation.title = "Big Ben"
                annotation.subtitle = "London"
                mapView.addAnnotation(annotation)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        location.latitude = locValue.latitude
        location.longitude = locValue.longitude
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

