//
//  BaseVC.swift
//  FoodBuddies
//
//  Copyright © 2017 Suraj. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
//TODO: - Initialization
    
    func createShareIcon(){ 
       /* var shareIcon = UIButton()
        shareIcon.frame = CGRect(x: UIScreen.main.bounds.size.width-60, y: 30, width: 40, height: 40)
        shareIcon.setImage(UIImage(named: "ic_share_white"), for: .normal)
        self.view.addSubview(shareIcon)*/
        
        
        let search = UIButton(frame: CGRect(x: UIScreen.main.bounds.size.width-100, y: 20, width: 40, height: 40))
        search.backgroundColor = .clear
       //search.setTitle("Srch", for: .normal)
        search.setImage(UIImage(named: "ic_search"), for: .normal)
        //button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
       self.view.addSubview(search)
        
        let button = UIButton(frame: CGRect(x: search.frame.origin.x + search.width-8, y: 20, width: 40, height: 40))
        button.backgroundColor = .clear
        //button.setTitle("Shre", for: .normal)
         button.setImage(UIImage(named: "ic_share"), for: .normal)
        //button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    
    
    
//TODO: - Custom Function
    
    
    func showAlert(_ title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    
    
    


}
