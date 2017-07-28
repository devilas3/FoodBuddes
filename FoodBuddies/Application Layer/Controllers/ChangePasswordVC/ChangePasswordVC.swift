//
//  ChangePasswordVC.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 17/07/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit
import Material

class ChangePasswordVC: BaseVC {

    
//TODO: - General
    
    
//TODO: - Controls
    
    @IBOutlet weak var btnChangePWDOutlet: UIButton!
    
    @IBOutlet weak var txtConfPassword: TextField!
    
    @IBOutlet weak var txtNewPassword: TextField!
    
    @IBOutlet weak var txtOldPassword: TextField!
    
    @IBOutlet weak var btnMenuOutlet: UIButton!
    
//TODO: - Let's Code

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

//TODO: - Function
    
    func checkMandatory()->Bool{
        var outVal : Bool = Bool()
        
        if self.txtOldPassword.text == ""{
            showAlert(appTitle, message: strEnterPassword)
            outVal = false
        }else if self.txtNewPassword.text == ""{
            showAlert(appTitle, message: strEnterPassword)
            outVal = false
        }else if self.txtConfPassword.text == ""{
            showAlert(appTitle, message: strEnterPassword)
            outVal = false
        }else if self.txtConfPassword.text == self.txtNewPassword.text{
            showAlert(appTitle, message: strPasswordDoesNotMatch)
            outVal = false
        }else{
            outVal = true
        }
        return outVal
    }
    
  
//TODO: - UIButton Action
    
    @IBAction func btnBackClick(_ sender: Any) {
        self.navigationController!.popViewController(animated: true)
        
    }
    
    
    
    @IBAction func btnChangePWDClick(_ sender: Any) {
        if checkMandatory(){
            showAlert(appTitle, message: "Password Changed..!!!")
            self.txtNewPassword.text = ""
            self.txtConfPassword.text = ""
            self.txtOldPassword.text = ""
            
        }
    }
    
}
