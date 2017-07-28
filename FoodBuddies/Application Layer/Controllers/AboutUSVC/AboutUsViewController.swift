//
//  AboutUsViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 26/06/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

class AboutUsViewController: BaseVC,UIWebViewDelegate {

//TODO: - General
    
    
//TODO: - Controls
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var btnBackOutlet: UIButton!
    
//TODO: - Let's Code
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*if FoodBuddiesSingleton.shared.htmlValue != 2{
            if self.revealViewController() != nil {
                btnBackOutlet.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
                self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            }
        }*/
        
        // Adding webView content
        do {
            guard let filePath = Bundle.main.path(forResource: "webpage", ofType: "html")
                else {
                    // File Error
                    print ("File reading error")
                    return
            }
            
            let contents =  try String(contentsOfFile: filePath, encoding: .utf8)
            let baseUrl = URL(fileURLWithPath: filePath)
            webView.loadHTMLString(contents as String, baseURL: baseUrl)
        }
        catch {
            print ("File HTML error")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.isNavigationBarHidden = true
        var screenName : String = String()
        if FoodBuddiesSingleton.shared.htmlValue == 1{
            screenName = "About Us"
        }else if FoodBuddiesSingleton.shared.htmlValue == 2{
            screenName = "Terms & Conditions"
            /*if FoodBuddiesSingleton.shared.isOpenFromMenu{
                 self.btnBackOutlet.setImage(UIImage(named: "menu"), for: .normal)
                //Assign Side menu
                if self.revealViewController() != nil {
                    btnBackOutlet.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
                    self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
                }
            }else{
                 self.btnBackOutlet.setImage(UIImage(named: "back"), for: .normal)
            }*/
           
        }else if FoodBuddiesSingleton.shared.htmlValue == 3{
            screenName = "Privacy Policy"
        }
        
        self.lblTitle.text = screenName
        showAlert("", message: screenName)
    }
    
    
//TODO: - Function
    
    
    
//TODO: - UIWebViewDelegate Method Implementation
    public func webViewDidStartLoad(_ webView: UIWebView){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    public func webViewDidFinishLoad(_ webView: UIWebView){
       UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    
//TODO: - UIButton Action
   
    @IBAction func btnBackClick(_ sender: Any) {
        if self.navigationController != nil{
            self.navigationController!.popViewController(animated: true)
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }

}
