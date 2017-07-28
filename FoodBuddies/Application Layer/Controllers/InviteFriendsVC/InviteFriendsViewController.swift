//
//  InviteFriendsViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 28/06/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit
import Material

class InviteFriendsViewController: BaseVC {

    
//TODO: - General
    
    
//TODO: - Controls
    
    @IBOutlet weak var btnMenuOutlet: UIButton!
    
    @IBOutlet weak var btnInviteTextOutlet: Button!
    
    @IBOutlet weak var btnInviteWhatsAppOutlet: Button!
    
    @IBOutlet weak var btnInviteFacebookOutlet: Button!
    
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
    
    @IBAction func btnInviteTextClick(_ sender: Any) {
    }
    
    @IBAction func btnInviteWhatsappClick(_ sender: Any) {
    }
    
    @IBAction func btnInviteFBClick(_ sender: Any) {
    }
    
    


}
