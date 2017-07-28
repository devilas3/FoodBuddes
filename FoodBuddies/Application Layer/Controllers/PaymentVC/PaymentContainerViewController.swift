//
//  PaymentContainerViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 29/06/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

class PaymentContainerViewController: BaseVC {

    
//TODO: - Genreal
    
  
    
//TODO: - Controls
    
    @IBOutlet weak var btnHostOutlet: UIButton!
    
    @IBOutlet weak var btnMenuOutlet: UIButton!
    
    @IBOutlet weak var btnGuestOutlet: UIButton!
    
//TODO: - Let's Code
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createShareIcon()
        
        // Do any additional setup after loading the view.
        self.btnGuestOutlet.setTitleColor(AppRedColor, for: .normal)
        self.btnHostOutlet.setTitleColor(UIColor.black, for: .normal)

        
        //Revealviewcontroller code
        if self.revealViewController() != nil {
            btnMenuOutlet.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//TODO: - UIButton Action
    
    @IBAction func btnHostClick(_ sender: Any) {
        self.selectViewController(segVal: 1)
    }

    @IBAction func btnGuestClick(_ sender: Any) {
        self.selectViewController(segVal: 0)
    }
    
    
    @IBAction func btnMenuClick(_ sender: Any) {
    }
    
    
  
//TODO: - Custom function to switch between view controller
    
    func selectViewController(segVal : Int){
        
        var viewControllerIdentifier = ["idPaymentGuestViewController","idPaymentHostViewController"]
        let seg = segVal
        if(seg == 0){
            
            //If required to pass data to view controller, just uncomment below line and access variable of child viewcontroller
            
            //let searchByNm : PaymentGuestViewController = PaymentGuestViewController()
          
            let newController = self.storyboard!.instantiateViewController(withIdentifier: viewControllerIdentifier[seg])
            
            let oldController = childViewControllers.last!
            newController.view.frame = oldController.view.frame
            oldController.willMove(toParentViewController: nil)
            addChildViewController(newController)
            
            transition(from: oldController, to: newController, duration: 0.25, options: .transitionCrossDissolve, animations:{ () -> Void in
                // nothing needed here
            }, completion: { (finished) -> Void in
                oldController.removeFromParentViewController()
                newController.didMove(toParentViewController: self)
            })
            
            self.btnGuestOutlet.setTitleColor(AppRedColor, for: .normal)
            self.btnHostOutlet.setTitleColor(UIColor.black, for: .normal)
            
        }else{
            
           // let searchByNm : PaymentGuestViewController = PaymentGuestViewController()
            
            let newController = self.storyboard!.instantiateViewController(withIdentifier: viewControllerIdentifier[seg])
            
            let oldController = childViewControllers.last!
            newController.view.frame = oldController.view.frame
            oldController.willMove(toParentViewController: nil)
            addChildViewController(newController)
            
            transition(from: oldController, to: newController, duration: 0.25, options: .transitionCrossDissolve, animations:{ () -> Void in
                // nothing needed here
            }, completion: { (finished) -> Void in
                oldController.removeFromParentViewController()
                newController.didMove(toParentViewController: self)
            })
            
            self.btnHostOutlet.setTitleColor(AppRedColor, for: .normal)
            self.btnGuestOutlet.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
}
