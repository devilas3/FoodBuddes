//
//  BookCountViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 22/07/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

class BookCountViewController: UIViewController {

    
//TODO: - General
    
    var globalCount : Int = Int()
//TODO: - Controls
    
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var lblCount: UILabel!
    
//TODO: - Let's Code
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.lblCount.text = "\(globalCount)"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        blurView.isUserInteractionEnabled = true
        blurView.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//TODO: - Function
    
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
        print("Tapped")
        self.dismiss(animated: false, completion: nil)
    }
    
//TODO: - UIButton Action
   
    @IBAction func btnPlusClick(_ sender: Any) {
        if globalCount <= 10{
            globalCount = globalCount + 1
        }
        self.lblCount.text = "0\(globalCount)"
    }
    
    @IBAction func btnMinusClick(_ sender: Any) {
        if globalCount > 1 {
            globalCount = globalCount - 1
        }
        self.lblCount.text = "0\(globalCount)"
    }
    
    

}
