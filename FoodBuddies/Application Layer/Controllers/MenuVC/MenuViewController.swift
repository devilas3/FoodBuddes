//
//  MenuViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 28/06/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

class MenuViewController: BaseVC, UITableViewDataSource,UITableViewDelegate {

    
//TODO: - General
    
    var menuArray : [String] = ["My Profile","Events","Party History","Setting","Help","Logout"]
    
//TODO: - Controls
    
    @IBOutlet weak var tblMain: UITableView!
    
//TODO: - Let's Code
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tblMain.delegate = self
        self.tblMain.dataSource = self
        
        self.tblMain.tableFooterView = UIView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tblMain.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //EOD commit

    
    
//TODO: - UITableViewDatasource Method implementation
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! MenuTableViewCell
        cell.lblTitle.text = self.menuArray[indexPath.row]
        
        if (FoodBuddiesSingleton.shared.menuSelectedIndex == indexPath.row){
            cell.indicatorView.isHidden = false
        }else{
            cell.indicatorView.isHidden = true
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let index = indexPath.row
        FoodBuddiesSingleton.shared.menuSelectedIndex = index
        switch index {
        case 0:
            //My Profile
            let profVC = self.storyboard?.instantiateViewController(withIdentifier: "idMyProfileViewController") as! MyProfileViewController
            let frontView = UINavigationController.init(rootViewController:profVC)
            revealViewController().pushFrontViewController(frontView, animated: true)
            
            break;
            //
        case 1:
            
            //Event
            let eventVC = self.storyboard?.instantiateViewController(withIdentifier: "idEventContainerViewController") as! EventContainerViewController
            let frontView = UINavigationController.init(rootViewController:eventVC)
            revealViewController().pushFrontViewController(frontView, animated: true)
            
            break;
            
        case 2:
            //Payment
            let paymentVC = self.storyboard?.instantiateViewController(withIdentifier: "idPaymentContainerViewController") as! PaymentContainerViewController
            let frontView = UINavigationController.init(rootViewController:paymentVC)
            revealViewController().pushFrontViewController(frontView, animated: true)
            break;

        case 3:
            //Settings
            let settingVC = self.storyboard?.instantiateViewController(withIdentifier: "idSettingsViewController") as! SettingsViewController
            let frontView = UINavigationController.init(rootViewController:settingVC)
            revealViewController().pushFrontViewController(frontView, animated: true)
            break;

        case 4:
            //Help
            let helpVC = self.storyboard?.instantiateViewController(withIdentifier: "idHelpViewController") as! HelpViewController
            let frontView = UINavigationController.init(rootViewController:helpVC)
            revealViewController().pushFrontViewController(frontView, animated: true)
            break;
        case 5:
            //Logout
            /*let inviteVC = self.storyboard?.instantiateViewController(withIdentifier: "idInviteFriendsViewController") as! InviteFriendsViewController
            let frontView = UINavigationController.init(rootViewController:inviteVC)
            revealViewController().pushFrontViewController(frontView, animated: true)*/
            self.navigationController!.popToRootViewController(animated: true)
            break;

        default:
            print("default")
            break;
        }
        
    }
    
    
    
    

}
