//
//  PaymentHostViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 29/06/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

class PaymentHostViewController: BaseVC,UITableViewDataSource,UITableViewDelegate {

    
//TODO: - General
    
    
//TODO: - Controls
    
    @IBOutlet weak var tblMain: UITableView!
    
//TODO: - Let's Code
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//TODO: - UITableViewDatasource Method implementation
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! PaymentHostTableViewCell
        
        cell.lblPrice.text = "£ 1200"
        cell.lblTime.text = "16 Jul 2017, 03:45PM"
        cell.lblEventName.text = "Ovenstory Pizza"
        cell.lblTotalGuest.text = "Total Guest: 12"
        cell.lblRating.text = "3.4\(Darkstar)"
        
         cell.imgPic.image = UIImage(named: "buffet.jpg")
          cell.imgPic.contentMode = UIViewContentMode.scaleToFill
        return cell
    }
    

    
    
    
//TODO: - UIButton Action

}
