//
//  PaymentGuestViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 29/06/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

class PaymentGuestViewController: BaseVC,UITableViewDelegate,UITableViewDataSource {

    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! PaymentGuestTableViewCell
        
        cell.lblDate.text = "16 Jul 2017, 3:47PM"
        cell.lblEventName.text = "Ovenstory Pizza"
        cell.lblHostName.text = "John Wick"
        cell.lblPrice.text = "£ 200"
        
        cell.imgPic.image = UIImage(named: "buffet.jpg")
        cell.imgPic.contentMode = UIViewContentMode.scaleToFill
        
        return cell
    }
    
    

    
    
    
//TODO: - UIButton Action

}
