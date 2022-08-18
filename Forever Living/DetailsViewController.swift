//
//  DetailsViewController.swift
//  Forever Living
//
//  Created by Muna Tayeb on 12/6/1438 AH.
//  Copyright © 1438 Free Developer. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    // Prop: The details view outlets
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDes: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet var contentview: UIView!
    
    // Prop: Variables filled when segue performed
    
    var pn = ""
    var pd = ""
    var pp = ""
    var pi: UIImage!
    
    
    
    // Func: Assign filled variables to the view outlets when view loaded
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productName.text = pn
        self.productDes.text = pd
        self.productPrice.text = pp
        self.productImage.image = pi
        productDes.sizeToFit()
        productName.sizeToFit()
    }
    
    // Func: Show all desc when 'show more' button clicked
    
    @IBAction func ShowMore(_ sender: Any) {
        self.productDes.numberOfLines = 0
        self.productDes.sizeToFit()
    
      //  adjust scroll view size
       var contentRect = CGRect.zero
       for view in self.scrollview.subviews {
           contentRect = contentRect.union(view.frame)
        }
        self.scrollview.contentSize = contentRect.size
        
       // hide the button
        (sender as! UIButton).isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
