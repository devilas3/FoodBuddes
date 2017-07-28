//
//  SignupFirstViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 28/06/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit
import Material

class SignupFirstViewController: BaseVC {

    
//TODO: - General
    
    
//TODO: - Controls
    
    @IBOutlet weak var btnProceedOutlet: Button!
    
    @IBOutlet weak var txtMobileNumber: TextField!
    
//TODO: - Let's Code
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //1
        txtMobileNumber.leftViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        let image = UIImage(named: "call")
        imageView.image = image
        txtMobileNumber.leftView = imageView
        txtMobileNumber.keyboardType = .numberPad

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        
        if FoodBuddiesSingleton.shared.userPhoneNo != ""{
            self.txtMobileNumber.text = FoodBuddiesSingleton.shared.userPhoneNo
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//TODO: - Function
    func checkMandatory()->Bool{
        var outVal : Bool = Bool()
        
        if self.txtMobileNumber.text == ""{
            outVal = false
            showAlert("", message: strEnterPhoneNo)
        }else{
            outVal = true
        }
        
        return outVal
    }
    
//TODO: - UIButton Action

    @IBAction func btnProceedClick(_ sender: Any) {
        if self.checkMandatory(){
            let signupSVC = self.storyboard?.instantiateViewController(withIdentifier: "idSignupSecondViewController") as! SignupSecondViewController
            FoodBuddiesSingleton.shared.userPhoneNo = self.txtMobileNumber.text!
            self.navigationController?.pushViewController(signupSVC, animated: true)
        }
    }
}
