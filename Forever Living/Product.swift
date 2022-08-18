//
//  Product.swift
//  Forever Living
//
//  Created by Muna Tayeb on 12/4/1438 AH.
//  Copyright © 1438 Free Developer. All rights reserved.
//

import Foundation
import RealmSwift

class product: Object {
    
    // Product class properties
    
    dynamic var name = ""
    dynamic var des = ""
    dynamic var price = 00.00
    dynamic var imageURL = ""
    dynamic var category = ""
    dynamic var imageData: NSData? = nil
    
    //MARK: Initialization
   
}
