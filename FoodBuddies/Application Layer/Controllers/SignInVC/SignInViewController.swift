//
//  SignInViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 15/07/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit
import Material

class SignInViewController: BaseVC {

//TODO: - General
    
    
//TODO: - Controls
    
    @IBOutlet weak var txtPassword: TextField!
    @IBOutlet weak var txtEmailAddress: TextField!
    
//TODO: - Let's Code
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
        self.initialization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
//TODO: Function
    
    
    func initialization(){
        txtEmailAddress.keyboardType = .emailAddress
        
        txtEmailAddress.leftViewMode = UITextFieldViewMode.always
        let emailView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        let emailImage = UIImage(named: "email")
        emailView.image = emailImage
        txtEmailAddress.leftView = emailView
        
        txtPassword.leftViewMode = UITextFieldViewMode.always
        let pwdView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        let pwdImage = UIImage(named: "pwd")
        pwdView.image = pwdImage
        txtPassword.leftView = pwdView
        
        createShareIcon()
    }
    
    func checkMandatory()->Bool{
        
        var outVal : Bool = Bool()
        if self.txtEmailAddress.text == ""{
            showAlert("", message: strEnterEmailID)
            outVal = false
        }else if self.txtPassword.text == ""{
            showAlert("", message: strEnterPassword)
            outVal = false
        }else if (!General.isValidEmail(testStr: self.txtEmailAddress.text!)){
            showAlert("", message: strEnterValidEmai)
            outVal = false
        }else{
            outVal = true
        }
        return outVal
    }
    
    
//TODO: - UIButton Action

    @IBAction func btnProceedClick(_ sender: Any) {
        if self.checkMandatory(){
            let signupFVC = self.storyboard?.instantiateViewController(withIdentifier: "idSignupFirstViewController") as! SignupFirstViewController
            FoodBuddiesSingleton.shared.userEmailID = self.txtEmailAddress.text!
            FoodBuddiesSingleton.shared.userPwd = self.txtPassword.text!
            self.navigationController?.pushViewController(signupFVC, animated: true)
        }
    }

    @IBAction func btnForgotPwdClick(_ sender: Any) {
    }
}
