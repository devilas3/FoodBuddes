//
//  MyProfileViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 28/06/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

class MyProfileViewController: BaseVC {

    
//TODO: - General
    
    
//TODO: - Controls
    
    @IBOutlet weak var btnMenuOutlet: UIButton!
    
//TODO: - Let's Code
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
        
        //Revealviewcontroller code
        if self.revealViewController() != nil {
            btnMenuOutlet.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
//TODO: - UIButton Action
    
    @IBAction func btnMenuClick(_ sender: Any) {
        
       
    }

}
