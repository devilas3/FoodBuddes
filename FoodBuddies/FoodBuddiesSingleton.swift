//
//  FoodBuddiesSingleton.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 05/07/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

final class FoodBuddiesSingleton {

    // Can't init is singleton
    private init() { }
    
    //MARK: Shared Instance
    static let shared: FoodBuddiesSingleton = FoodBuddiesSingleton()
    
    //MARK: Local Variable
   
    var htmlValue : Int = Int()    // 1: About us, 2: terms, 3: Privacy policy
    var childValue : Int = Int()   //0: Event info, 1: Event- About food, 2: event availability, 3: event venu, 4: event booked guest
    var isOpenFromMenu : Bool = Bool()
    var menuSelectedIndex : Int = Int()
    
    
    //MARK: UserData
    var userEmailID : String = String()
    var userPwd : String = String()
    var userPhoneNo : String = String()
    
    var iAgreeVal : Int = Int()
    
}
