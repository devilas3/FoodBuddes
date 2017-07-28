//
//  HelpViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 24/07/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

class HelpViewController: BaseVC {

    
    
//TODO: - General
    
    
//TODO: - Controls
    
    @IBOutlet weak var btnAboutUsOutlet: UIButton!
    
    @IBOutlet weak var btnContactUsOutlet: UIButton!
    
    @IBOutlet weak var btnTermsOutlet: UIButton!
    
    @IBOutlet weak var btnPrivacyOutlet: UIButton!
    
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
    
    @IBAction func btnAboutUsClick(_ sender: Any) {
        let aboutVC = self.storyboard?.instantiateViewController(withIdentifier: "idAboutUsViewController") as! AboutUsViewController
        FoodBuddiesSingleton.shared.htmlValue = 1
        self.navigationController?.pushViewController(aboutVC, animated: true)
    }

    
    @IBAction func btnContactUsClick(_ sender: Any) {
        let contVC = self.storyboard?.instantiateViewController(withIdentifier: "idContactUSViewController") as! ContactUSViewController
        FoodBuddiesSingleton.shared.htmlValue = 1
        self.navigationController?.pushViewController(contVC, animated: true)
    }
    
    
    @IBAction func btnTermsClick(_ sender: Any) {
        let aboutVC = self.storyboard?.instantiateViewController(withIdentifier: "idAboutUsViewController") as! AboutUsViewController
        FoodBuddiesSingleton.shared.htmlValue = 2
        self.navigationController?.pushViewController(aboutVC, animated: true)
    }
    
    @IBAction func btnPrivacyClick(_ sender: Any) {
        let aboutVC = self.storyboard?.instantiateViewController(withIdentifier: "idAboutUsViewController") as! AboutUsViewController
        FoodBuddiesSingleton.shared.htmlValue = 3
        self.navigationController?.pushViewController(aboutVC, animated: true)
    }
    
    
    
    
    
    
}
