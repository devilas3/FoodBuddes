//
//  PaymentGuestTableViewCell.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 29/06/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

class PaymentGuestTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var imgPic: UIImageView!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblEventName: UILabel!
    
    @IBOutlet weak var lblHostName: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
