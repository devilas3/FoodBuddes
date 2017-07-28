//
//  EventDetailViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 05/07/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit


enum Direction { case In, Out }

protocol Dimmable { }

extension Dimmable where Self: UIViewController {
    
    func dim(direction: Direction, color: UIColor = UIColor.black, alpha: CGFloat = 0.0, speed: Double = 0.0) {
        
        switch direction {
        case .In:
            
            // Create and add a dim view
            let dimView = UIView(frame: view.frame)
            dimView.backgroundColor = color
            dimView.alpha = 0.0
            view.addSubview(dimView)
            
            // Deal with Auto Layout
            dimView.translatesAutoresizingMaskIntoConstraints = false
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[dimView]|", options: [], metrics: nil, views: ["dimView": dimView]))
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[dimView]|", options: [], metrics: nil, views: ["dimView": dimView]))
            
            // Animate alpha (the actual "dimming" effect)
            UIView.animate(withDuration: speed) { () -> Void in
                dimView.alpha = alpha
            }
            
        case .Out:
            UIView.animate(withDuration: speed, animations: { () -> Void in
                self.view.subviews.last?.alpha = alpha 
            }, completion: { (complete) -> Void in
                self.view.subviews.last?.removeFromSuperview()
            })
        }
    }
}




class mainCollectionViewCell : UICollectionViewCell{
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblUnderline: UILabel!
    
}



class mainTableViewCell : UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
//TODO: - General
    
    let titleArray : [String] = ["   info   ", "   Food   ", "   Availability   ", "   Venue   ", "   Party Goers   "]
//TODO: - Controls
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
//TODO: - Let's Code
    
    override func awakeFromNib() {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
    }
    
    
    
//TODO: - UICollectionViewDatasource method implementation
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return titleArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as! mainCollectionViewCell
        cell.lblTitle.text = self.titleArray[indexPath.row]
        
        if FoodBuddiesSingleton.shared.childValue == indexPath.row{
            cell.lblUnderline.isHidden = false
        }else{
            cell.lblUnderline.isHidden = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("indexPath:\(indexPath.row)")
        FoodBuddiesSingleton.shared.childValue = indexPath.row
       NotificationCenter.default.post(name: Notification.Name("changeChildForMe"), object: nil)
        mainCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let attString = NSAttributedString(string: self.titleArray[indexPath.row], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15.0)])
       
        let r: CGRect = attString.boundingRect(with: CGSize(width: self.mainCollectionView.bounds.size.width, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil)
        print("r.size:\(r.size)")
        return r.size

    }
    
    
    
    
    
}


//Class ends



class EventDetailViewController: BaseVC, UITableViewDataSource,UITableViewDelegate {

    
//TODO: - General
    
    
    
//TODO: - Controls
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var tblMain: UITableView!
    
    @IBOutlet weak var footerView: UIView!
    
    @IBOutlet weak var mainContainerView: UIView!
    
    //EOD Commit
    
//TODO: - Let's Code
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createShareIcon()
        
        // Do any additional setup after loading the view.
        self.tblMain.delegate = self
        self.tblMain.dataSource = self
        
       NotificationCenter.default.addObserver(self, selector: #selector(EventDetailViewController.methodOfReceivedNotification(notification:)), name: Notification.Name("changeChildForMe"), object: nil)

        
    }
    
    func methodOfReceivedNotification(notification: Notification){
        //Take Action on Notification
        self.selectViewController(segVal: FoodBuddiesSingleton.shared.childValue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
//TODO: - UITableViewDatasource Method implementation
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! mainTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
    

    
    
//TODO: - Custom function to switch between view controller
    
    func selectViewController(segVal : Int){
        
        var viewControllerIdentifier = ["idEventInfoViewController","idEventAboutFoodViewController","idEventAvailabilityViewController","idEventVenueViewController","idEventBookedGuestViewController"]
        
        let seg = segVal
        
        //If required to pass data to view controller, just uncomment below line and access variable of child viewcontroller
        
        //let searchByNm : PaymentGuestViewController = PaymentGuestViewController()
        
        let newController = self.storyboard!.instantiateViewController(withIdentifier: viewControllerIdentifier[seg])
        
        let oldController = childViewControllers.last!
        newController.view.frame = oldController.view.frame
        oldController.willMove(toParentViewController: nil)
        addChildViewController(newController)
        
        transition(from: oldController, to: newController, duration: 0.25, options: .transitionCrossDissolve, animations:{ () -> Void in
            // nothing needed here
        }, completion: { (finished) -> Void in
            oldController.removeFromParentViewController()
            newController.didMove(toParentViewController: self)
        })
        
        
       
    }
    
    
    
//TODO: - UIButton Action
    
    @IBAction func btnBackClick(_ sender: Any) {
        if self.navigationController != nil{
            self.navigationController!.popViewController(animated: true)
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
