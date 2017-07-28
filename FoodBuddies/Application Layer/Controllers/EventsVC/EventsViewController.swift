//
//  EventsViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 28/06/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit



class EventTableViewCell : UITableViewCell{
    
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var imgPic: UIImageView!
    
    @IBOutlet weak var lbLEventName: UILabel!
    
    @IBOutlet weak var lblEventAddress: UILabel!
    
    @IBOutlet weak var lblEventPrice: UILabel!
    
    @IBOutlet weak var lblAvailable: UILabel!
    
    
    
    
}

class EventsViewController: BaseVC,UITableViewDataSource,UITableViewDelegate {


//TODO: - General
    
    
//TODO: - Controls
    
    
    @IBOutlet weak var tblMain: UITableView!
    
//TODO: - Let's Code
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createShareIcon()
        
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! EventTableViewCell
        
        cell.lblDate.text = "07 Jul 2017, 2:51 PM"
        cell.lblAvailable.text = "2.5\(star)  Available Seats: 05"
        cell.lblEventPrice.text = "£ 100"
        cell.lbLEventName.text = "Panjabi Night"
        cell.lblEventAddress.text = "North India, Chinese"
        cell.imgPic.image = UIImage(named: "1.jpg")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath:\(indexPath.row)")
        let dtVC = self.storyboard?.instantiateViewController(withIdentifier: "idEventDetailViewController") as! EventDetailViewController
        self.navigationController?.pushViewController(dtVC, animated: true)
    }
    
    

//TODO: - UIButton Action
   
    

}
