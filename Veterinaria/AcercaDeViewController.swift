//
//  AcercaDeViewController.swift
//  Veterinaria
//
//  Created by Mac10 on 11/12/21.
//

import UIKit
import MapKit

class AcercaDeViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var Mapa: MKMapView!
    let manager = CLLocationManager()
    let lat:CLLocationDegrees = 20.14804
    let lon: CLLocationDegrees = -101.71289

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let marcador = MKPointAnnotation()
        marcador.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        marcador.title = "Veterinaria Alexander"
        
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let  region  = MKCoordinateRegion(center: marcador.coordinate, span: span)
        
        self.Mapa.setRegion(region, animated: true)
        self.Mapa.addAnnotation(marcador)
        self.Mapa.selectAnnotation(marcador, animated: true)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        
    }

}
