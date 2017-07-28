//
//  PaymentHostTableViewCell.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 29/06/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

class PaymentHostTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var lblRating: UILabel!
    
    @IBOutlet weak var imgPic: UIImageView!
    
    @IBOutlet weak var lblEventName: UILabel!
    
    @IBOutlet weak var lblTotalGuest: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
