//
//  EventInfoViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 06/07/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

class EventInfoViewController: BaseVC {

    
//TODO: - General
    
   
//TODO: - Controls
    
    
//TODO: - Let's Code
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    
    
//TODO: - UIButton Action
    @IBAction func btnBookNowClick(_ sender: Any) {
        let bookCountVC = self.storyboard?.instantiateViewController(withIdentifier: "idBookCountViewController") as! BookCountViewController
        bookCountVC.view.backgroundColor = .clear
        bookCountVC.modalPresentationStyle = .overCurrentContext
        self.present(bookCountVC, animated: false, completion: nil)
    }
}
