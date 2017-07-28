//
//  ContactUSViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 26/06/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

import GoogleMaps


class ContactUSViewController: BaseVC {

    
    
//TODO: - General
    
    
//TODO: - Controls
    
    @IBOutlet weak var btnMenuOutlet: UIButton!
    
    @IBOutlet weak var viewAddress: UIView!
    
    @IBOutlet weak var viewMap: GMSMapView!
    
    @IBOutlet weak var lblCopyright: UILabel!
    
//TODO: - Let's Code
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        
        /*if self.revealViewController() != nil {
            btnMenuOutlet.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        */
        self.googleMap()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func googleMap(){
        let camera = GMSCameraPosition.camera(withLatitude: 20.046255, longitude: 76.693497, zoom: 12)
        self.viewMap.camera = camera
        
        let initialLocation = CLLocationCoordinate2DMake(20.046255, 76.693497)
        let marker = GMSMarker(position: initialLocation)
        marker.title = "Wakad"
        marker.map = viewMap
    }

    
//TODO: - UIButton Action
   
    @IBAction func btnBackClick(_ sender: Any) {
      
    }

}
