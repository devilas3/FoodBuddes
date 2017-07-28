//
//  NotificationListViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 28/06/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit

class NotificationListViewController: BaseVC,UITableViewDataSource,UITableViewDelegate {

    
//TODO: - General
    
    
//TODO: - Controls
    
    @IBOutlet weak var tblMain: UITableView!
    
//TODO: - Let's Code
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createShareIcon()
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! NotificationTableViewCell
        
        return cell
    }
    

    
    
    
    
//TODO: - UIButton Action
    
    
    

}
