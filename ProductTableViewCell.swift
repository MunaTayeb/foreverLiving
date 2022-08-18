//
//  ProductTableViewCell.swift
//  Forever Living
//
//  Created by Muna Tayeb on 12/4/1438 AH.
//  Copyright © 1438 Free Developer. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    // Prop: Table view cell outlets
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
