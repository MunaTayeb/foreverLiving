//
//  ViewController.swift
//  Forever Living
//
//  Created by Muna Tayeb on 11/30/1438 AH.
//  Copyright © 1438 Free Developer. All rights reserved.
//

import UIKit
import ImageSlideshow


class ViewController: UIViewController, UISearchBarDelegate{
    
    // Prob: home screen outlets
    
    var category = ""
    var isSearching = false
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var slideShow: ImageSlideshow!
   
    
   // Func: - call setups functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpImageSlider()
        searchBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Func: - Setup home screen logo
    
    func setUpUI() {
       let logoImage = UIImage.init(named: "forever-bird")
       // let logoImageView = UIImageView.init(image: logoImage)
       // logoImageView.frame = CGRect(x: -30, y: 10, width: 55, height: 45)
       // logoImageView.contentMode = .scaleAspectFit
       // let imageItem = UIBarButtonItem.init(customView: logoImageView)
        //let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        //negativeSpacer.width = -20
      //  navigationItem.leftBarButtonItems = [imageItem]
       
    }
   
    //Func: - Setup home screen image slider
    
    func setUpImageSlider(){
        let localSource = [ImageSource(imageString: "img1")!, ImageSource(imageString: "img2")!, ImageSource(imageString: "img3")!, ImageSource(imageString: "img4")!, ImageSource(imageString: "img5")!, ImageSource(imageString: "img6")!, ImageSource(imageString: "img7")!]

        slideShow.backgroundColor = UIColor.white
        slideShow.slideshowInterval = 5.0
        slideShow.pageControlPosition = PageControlPosition.underScrollView
        slideShow.pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        slideShow.pageControl.pageIndicatorTintColor = UIColor.black
        slideShow.contentScaleMode = UIViewContentMode.scaleToFill
        slideShow.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap))
        slideShow.addGestureRecognizer(recognizer)
    }
    
    func didTap() {
        _ = slideShow.presentFullScreenController(from: self)
        
    }

    // Sec: - Handle categories button clicks
    
    @IBAction func HealthButton(_ sender: Any) {
        category = "Health"
        self.performSegue(withIdentifier: "ProductListTable", sender: self)
    }
    
    @IBAction func HairButton(_ sender: Any) {
        category = "Hair"
        self.performSegue(withIdentifier: "ProductListTable", sender: self)

    }
    
    @IBAction func PersonalButton(_ sender: Any) {
        category =  "Personal"
        self.performSegue(withIdentifier: "ProductListTable", sender: self)

    }
    
    @IBAction func SkinButton(_ sender: Any) {
        category =  "Skin"
        self.performSegue(withIdentifier: "ProductListTable", sender: self)

    }
    
    @IBAction func SpecOffersButton(_ sender: Any) {
        category =  "Offer"
        self.performSegue(withIdentifier: "ProductListTable", sender: self)

    }
    
    @IBAction func BundleButton(_ sender: Any) {
        category =  "Bundle"
        self.performSegue(withIdentifier: "ProductListTable", sender: self)

    }
    
    // Func: - prepare table view variables just before segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableViewController = segue.destination as! ProductTableViewController
        tableViewController.filterString = category
        tableViewController.compareName = isSearching
    }
    
    
    // Sec: - search bar handling methods
    
   func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    
    if (searchBar.text != "") {
        category = searchBar.text!
        isSearching = true
        self.performSegue(withIdentifier: "ProductListTable", sender: self)
    }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
         searchBar.setShowsCancelButton(false, animated: true)
         searchBar.endEditing(true)
         searchBar.text = ""
    }

}

