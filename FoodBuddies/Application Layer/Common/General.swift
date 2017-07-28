//
//  General.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 15/07/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

class General {

   static func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
