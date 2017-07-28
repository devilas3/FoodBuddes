//
//  CreateEventViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 13/07/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

import Material

class MenuDetailsTableViewCell : UITableViewCell{
    
    @IBOutlet weak var btnAdd: UIButton!
    
    @IBOutlet weak var txtMenuName: UITextField!
    
    @IBOutlet weak var txtIngredients: UITextField!
}



class CreateEventViewController: BaseVC, UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,SwiftlySliderDelegate {

    
//TODO: - General
    var isTextChanged : Bool = Bool()
    
    var isVegSelected : Bool = Bool()
    var isNonVegSelected : Bool = Bool()
    var isVeganSelected : Bool = Bool()
    
//TODO: - Controls
    
    @IBOutlet weak var btnMenuOutlet: UIButton!
    
    @IBOutlet weak var txtEventName: TextField!
    
    @IBOutlet weak var btnUploadImage: UIButton!
    
    @IBOutlet weak var btnUploadVideo: UIButton!
    
    @IBOutlet weak var slider: SwiftlySlider!
    
    @IBOutlet weak var btnDateEvent: UIButton!
    
    @IBOutlet weak var btnTimeStartEvent: UIButton!
    
    @IBOutlet weak var btnTimeEndEvent: UIButton!
    
    @IBOutlet weak var txtDineIn: UITextField!
    
    @IBOutlet weak var txtDineInCost: UITextField!
    
    @IBOutlet weak var txtTakeAway: UITextField!
    
    @IBOutlet weak var txtTakeAwayCost: UITextField!
    
    @IBOutlet weak var lblEuro2: UILabel!
    
    @IBOutlet weak var lblEuro1: UILabel!
    
    
    @IBOutlet weak var btnVegOutlet: UIButton!
    
    @IBOutlet weak var btnNonVegOutlet: UIButton!
    
    @IBOutlet weak var btnVeganOutlet: UIButton!
    
    @IBOutlet weak var txtSpecialNote: UITextView!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    
//TODO: - Let's Code

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createShareIcon()
        
        //Slider Setup
        slider.direction = SwiftlySlider.PickerDirection.horizontal
        slider.currentValue = 1
        slider.maxValue = 30
        slider.minValue = 1
        slider.sliderImage = UIImage(named: imgLighGreenChilli)
        slider.barColor = AppRedColor
        
        //Revealviewcontroller code
        if self.revealViewController() != nil {
            btnMenuOutlet.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.txtSpecialNote.text = ""
        self.txtSpecialNote.borderColor = UIColor.lightGray
        self.txtSpecialNote.borderWidth = 1.0
        self.txtSpecialNote.delegate = self
        
        self.initPlaceholderForTextView()
        
        slider.delegate = self
    }
    
    func initPlaceholderForTextView(){
        txtSpecialNote.text = "Special notes"
        txtSpecialNote.textColor = UIColor.lightGray
        self.isTextChanged = false
    }
    
    
//TODO:- UISliderDelegate Method implementation
    func swiftlySliderValueChanged(_ value: Int) {
        print("value:\(value)")
        if value<10{
            slider.sliderImage = UIImage(named: imgLighGreenChilli)
        }else if value>10 && value<20{
            slider.sliderImage = UIImage(named: imgGreenChilli)
        }else if value>20{
            slider.sliderImage = UIImage(named: imgRedChilli)
        }
    }
    
//TODO: UITextViewDelegate Methods
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray{
            textView.text = nil
            textView.textColor = UIColor.black
            if(textView == txtSpecialNote){
                self.isTextChanged = true
            }
            
            
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == txtSpecialNote{
            if textView.text.isEmpty{
                txtSpecialNote.text = "Special notes"
                txtSpecialNote.textColor = UIColor.lightGray
                self.isTextChanged = false
            }
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
    
    
//TODO: - Function
    
    
    
//TODO: - UITableViewDatasource Method implementation
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! MenuDetailsTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    

    
    
    
    
//TODO: - UIButton Action
    
    @IBAction func btnSubmitClick(_ sender: Any) {
    }

    @IBAction func btnUploadImageClick(_ sender: Any) {
    }
    
    @IBAction func btnUploadVideoClick(_ sender: Any) {
    }
    
    
    @IBAction func btnVeganClick(_ sender: Any) {
        if isVeganSelected{
            isVeganSelected = false
            self.btnVeganOutlet.setImage(UIImage(named: strTickEmpty), for: .normal)
        }else{
            isVeganSelected = true
            self.btnVeganOutlet.setImage(UIImage(named: strTickFill), for: .normal)
        }
    }
    
    
    @IBAction func btnNonVegClick(_ sender: Any) {
        if isNonVegSelected{
            isNonVegSelected = false
            self.btnNonVegOutlet.setImage(UIImage(named: strTickEmpty), for: .normal)
        }else{
            isNonVegSelected = true
            self.btnNonVegOutlet.setImage(UIImage(named: strTickFill), for: .normal)
        }
    }
    
    
    @IBAction func btnVegClick(_ sender: Any) {
        if isVegSelected{
            isVegSelected = false
            self.btnVegOutlet.setImage(UIImage(named: strTickEmpty), for: .normal)
        }else{
            isVegSelected = true
            self.btnVegOutlet.setImage(UIImage(named: strTickFill), for: .normal)
        }
    }

}
