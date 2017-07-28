//
//  EventImageScrollViewController.swift
//  FoodBuddies
//
//  Created by Suraj Sonawane on 05/07/17.
//  Copyright © 2017 demo. All rights reserved.
//

import UIKit
import Foundation

class EventImageScrollViewController: UIViewController, UIScrollViewDelegate {

    
    
//TODO: - General
    
    var imageData : [String] = ["buffet.jpg","buffet.jpg","buffet.jpg","buffet.jpg"]
    var globalTimer = Timer()
//TODO: - Controls
    var currentInd : Int = Int()
    
    var scrollView : UIScrollView = UIScrollView()
    var pageControl : UIPageControl = UIPageControl()
    
    @IBOutlet weak var headerView: UIView!
    
    
    
//TODO: - Let's Code
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.removeControllsFromSubView()
        self.firstMethods()
        
        globalTimer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(EventImageScrollViewController.sayHello), userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        globalTimer.invalidate()
    }
    
    
    func sayHello()
    {
        if currentInd == self.imageData.count{
            currentInd = 0
            scrollToPage(currentInd)
        }else{
            currentInd = currentInd + 1
            self.scrollToPage(currentInd)
        }
        
        NSLog("hello World")
    }
    
    
    func scrollToPage(_ page: Int) {
        UIView.animate(withDuration: 0.3) {
            self.scrollView.contentOffset.x = self.scrollView.frame.width * CGFloat(page)
        }
    }
//TODO: - Function
    
    
    func removeControllsFromSubView()
    {
        for view in headerView.subviews {
            view.removeFromSuperview()
        }
        
    }
    
    
    
    func firstMethods(){
        
        self.scrollView = UIScrollView(frame: self.headerView.frame)
        self.scrollView.delegate = self
        
        print("containerView.frame:\(headerView.frame)")
        self.scrollView.isPagingEnabled = true
        self.scrollView.frame = self.view.bounds; // Instead of using auto layout
        self.headerView.addSubview(self.scrollView)
        
        
        //PageControl
     
        self.pageControl = UIPageControl(frame: CGRect(x: CGFloat(0.0), y: CGFloat(self.headerView.frame.size.height-20), width: CGFloat(self.headerView.frame.size.width), height: CGFloat(10.0)))
        
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        
        self.pageControl.currentPageIndicatorTintColor = UIColor.darkGray
        self.pageControl.currentPage = 1
        self.headerView.addSubview(self.pageControl)
        
        createScroll()
        
        
        
        self.pageControl.numberOfPages = (self.imageData.count)
        self.scrollView.contentSize = CGSize(width: self.headerView.frame.width*CGFloat((self.imageData.count)), height: self.scrollView.frame.height) //CGSizeMake(self.headerView.frame.width*CGFloat((self.hotelData.count)), self.scrollView.frame.height)
        let scrollPoint : CGPoint = CGPoint(x: 0.0, y: 0.0) // CGPointMake(0, 0)
        self.scrollView.setContentOffset(scrollPoint, animated: true)
        
    }
    
    
    func createScroll(){
        let originalWidth : CGFloat = self.headerView.frame.size.width
        let originalHeight : CGFloat = self.headerView.frame.size.height
        
        
        if(self.imageData.count>0){
            for  i in 0...self.imageData.count-1{
                print(i)
                
                let viewback: UIView = UIView(frame: CGRect(x: originalWidth * CGFloat(i), y: 0, width: originalWidth, height: originalHeight))
                
                let imageView : UIImageView = UIImageView(frame:CGRect(x: self.headerView.frame.origin.x, y: self.headerView.frame.origin.y+10, width: self.headerView.frame.size.width, height: self.headerView.frame.size.height-10))
                imageView.contentMode = UIViewContentMode.scaleToFill
                
                imageView.image = UIImage(named: self.imageData[i])
                //let ur = NSURL(string: self.hotelData[i])
                //imageView.sd_setImageWithURL(ur, placeholderImage: UIImage(named: "photo_placeholder_large"), options: SDWebImageOptions.RefreshCached)
                
                viewback.addSubview(imageView)
                self.scrollView.delegate = self
                self.scrollView.addSubview(viewback)
                
            }
            
        }
    }
    
    
    
    
    //TODO: -UIScrollViewDelegate Method implementation
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth : CGFloat = scrollView.bounds.width
        let pageFraction : CGFloat = self.scrollView.contentOffset.x / pageWidth
        self.pageControl.currentPage = Int(pageFraction)
        
    }
    
    

    
//TODO: - UIButton Action
    
   

}
