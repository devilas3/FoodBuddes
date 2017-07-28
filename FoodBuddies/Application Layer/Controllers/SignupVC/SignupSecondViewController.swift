//
//  SignupSecondViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 28/06/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit
import Material

class SignupSecondViewController: BaseVC {


//TODO: - General
    
    
//TODO: - Controls
    
    @IBOutlet weak var txtPhoneNumber: TextField!
    
    @IBOutlet weak var txtFirstName: TextField!
    
    @IBOutlet weak var txtEmailID: TextField!
    
    @IBOutlet weak var txtAddress: UITextView!
    
    @IBOutlet weak var txtPostcode: TextField!
    
    @IBOutlet weak var txtPassword: TextField!
    
    @IBOutlet weak var txtConfPassword: TextField!
    
    @IBOutlet weak var btnCheckMark: UIButton!
    
    @IBOutlet weak var btnRegisterOutlet: Button!
   
    
    
    
//TODO: - Let's Code
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       self.initialization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.txtPhoneNumber.text = FoodBuddiesSingleton.shared.userPhoneNo
        self.txtEmailID.text = FoodBuddiesSingleton.shared.userEmailID
        self.txtPassword.text = FoodBuddiesSingleton.shared.userPwd
        self.txtConfPassword.text = FoodBuddiesSingleton.shared.userPwd
        
        if FoodBuddiesSingleton.shared.iAgreeVal == 1{
                btnCheckMark.setImage(UIImage(named: "tick_fill"), for: .normal)
        }
    }
    
    
    
    func initialization(){
        
        //1
        txtPhoneNumber.leftViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        let image = UIImage(named: "call")
        imageView.image = image
        txtPhoneNumber.leftView = imageView
        txtPhoneNumber.keyboardType = .numberPad
        
        //2
        
        txtFirstName.leftViewMode = UITextFieldViewMode.always
        let firstView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        let firstImage = UIImage(named: "user")
        firstView.image = firstImage
        txtFirstName.leftView = firstView
        
        //3
        
        txtEmailID.leftViewMode = UITextFieldViewMode.always
        let emailView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        let emailImage = UIImage(named: "email")
        emailView.image = emailImage
        txtEmailID.leftView = emailView
        txtEmailID.keyboardType = .emailAddress
        
        //4
        
        txtPostcode.leftViewMode = UITextFieldViewMode.always
        let postView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        let postImage = UIImage(named: "map_pointer")
        postView.image = postImage
        txtPostcode.leftView = postView
        txtPostcode.keyboardType = .numberPad
        
        //5
        
        txtPassword.leftViewMode = UITextFieldViewMode.always
        let passwordView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        let passwordImage = UIImage(named: "pwd")
        passwordView.image = passwordImage
        txtPassword.leftView = passwordView
        
        //6
        
        txtConfPassword.leftViewMode = UITextFieldViewMode.always
        let confPView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        let confImage = UIImage(named: "pwd")
        confPView.image = confImage
        txtConfPassword.leftView = confPView
        
        //7
        /*txtAddress.leftViewMode = UITextFieldViewMode.always
        let addressView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let addImage = UIImage(named: "call")
        addressView.image = addImage
        txtAddress.leftView = addressView*/

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//TODO: - UIButton Action

    @IBAction func btnRegisterAction(_ sender: Any) {
        let idReveal = self.storyboard?.instantiateViewController(withIdentifier: "idReveal") as! SWRevealViewController
        self.navigationController?.pushViewController(idReveal, animated: true)
    }
    
    @IBAction func btnTermsClick(_ sender: Any) {
        let tncVC = self.storyboard?.instantiateViewController(withIdentifier: "idAboutUsViewController") as! AboutUsViewController
        FoodBuddiesSingleton.shared.htmlValue = 2
        FoodBuddiesSingleton.shared.isOpenFromMenu = false
        self.present(tncVC, animated: true, completion: nil)    
    }
    
    @IBAction func btnCheck(_ sender: Any) {
        if FoodBuddiesSingleton.shared.iAgreeVal == 1{
            btnCheckMark.setImage(UIImage(named: "tick_empt"), for: .normal)
             FoodBuddiesSingleton.shared.iAgreeVal = 0
        }else {
            btnCheckMark.setImage(UIImage(named: "tick_fill"), for: .normal)
             FoodBuddiesSingleton.shared.iAgreeVal = 1
        }
    }
    
}
