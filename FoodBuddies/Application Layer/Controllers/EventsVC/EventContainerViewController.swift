//
//  EventContainerViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 13/07/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

class EventContainerViewController: BaseVC {

    
    
//TODO: - General
    
    
//TODO: - Controls
    @IBOutlet weak var btnEventOutlet: UIButton!
    
    @IBOutlet weak var btnMenuOutlet: UIButton!
    
    @IBOutlet weak var btnCreateEventOutlet: UIButton!
    
    @IBOutlet weak var mainContainer: UIView!
    
    
//TODO: - Let's Code
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createShareIcon()
        //Revealviewcontroller code
        
        if self.revealViewController() != nil {
            btnMenuOutlet.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.isNavigationBarHidden = true
        
        self.btnEventOutlet.setImage(UIImage(named: "menu_lt_act"), for: .normal)
        self.btnCreateEventOutlet.setImage(UIImage(named: "menu_rt"), for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//TODO: - UIButton Action
    
    @IBAction func btnEventClick(_ sender: Any) {
        self.selectViewController(segVal: 0)
    }
    
 
   
    
    @IBAction func btnCreateEventClick(_ sender: Any) {
        self.selectViewController(segVal: 1)
    }
    
    
    //TODO: - Custom function to switch between view controller
    
    func selectViewController(segVal : Int){
        
        var viewControllerIdentifier = ["idEventsViewController","idCreateEventViewController"]
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
            
            self.btnEventOutlet.setImage(UIImage(named: "menu_lt_act"), for: .normal)
            self.btnCreateEventOutlet.setImage(UIImage(named: "menu_rt"), for: .normal)
            
            
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
            
            
            self.btnEventOutlet.setImage(UIImage(named: "menu_lt"), for: .normal)
            self.btnCreateEventOutlet.setImage(UIImage(named: "menu_rt_act"), for: .normal)
            
        }
    }
    
}
