//
//  EventVenueViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 07/07/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit
import GoogleMaps

class EventVenueViewController: UIViewController {


//TODO: - General
    
    
//TODO: - Controls
    
    @IBOutlet weak var mapView: GMSMapView!
    
    
//TODO: - Let's Code
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.mapInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    func mapInit(){
        let camera = GMSCameraPosition.camera(withLatitude: 52.520736, longitude: 13.409423, zoom: 12)
        self.mapView.camera = camera
        
        let initialLocation = CLLocationCoordinate2DMake(52.520736, 13.409423)
        let marker = GMSMarker(position: initialLocation)
        marker.title = "Berlin"
        marker.map = mapView
    }

    
//TODO: - UIButton Action
    
    @IBAction func btnBookNowClick(_ sender: Any) {
        let bookCountVC = self.storyboard?.instantiateViewController(withIdentifier: "idBookCountViewController") as! BookCountViewController
        bookCountVC.view.backgroundColor = .clear
        bookCountVC.modalPresentationStyle = .overCurrentContext
        self.present(bookCountVC, animated: false, completion: nil)
    }
    
    

}
