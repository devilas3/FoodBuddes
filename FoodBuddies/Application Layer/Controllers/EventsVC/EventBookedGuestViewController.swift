//
//  EventBookedGuestViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 07/07/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit


class EventBookGuestTableViewCell : UITableViewCell{
    
    
    @IBOutlet weak var imgPic: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDineIn: UILabel!
    @IBOutlet weak var lblTakeAway: UILabel!
    
}

class EventBookedGuestViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
//TODO: - UITableViewDatasource Method Implementation
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! EventBookGuestTableViewCell
        
        cell.lblTitle.text = "Smith Faln"
        cell.imgPic.image = UIImage(named: "person.png")
        cell.imgPic.layer.cornerRadius = cell.imgPic.height/2
        cell.imgPic.clipsToBounds = true
        
        
        cell.selectionStyle = .none
        if indexPath.row % 2 == 0 {
            cell.lblDineIn.textColor = UIColor.black
            cell.lblTakeAway.textColor = UIColor.gray
            
        }else{
            cell.lblDineIn.textColor = UIColor.gray
            cell.lblTakeAway.textColor = UIColor.black
            
        }
       
        return cell
    }

    
    
    
//TODO: - UIButton Action
    
    
    
    @IBAction func btnBookNowClick(_ sender: Any) {
        let bookCountVC = self.storyboard?.instantiateViewController(withIdentifier: "idBookCountViewController") as! BookCountViewController
        bookCountVC.view.backgroundColor = .clear
        bookCountVC.modalPresentationStyle = .overCurrentContext
        self.present(bookCountVC, animated: false, completion: nil)
    }
    


}
