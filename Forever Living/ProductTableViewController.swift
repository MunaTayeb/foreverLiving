//
//  ProductTableViewController.swift
//  Forever Living
//
//  Created by Muna Tayeb on 12/4/1438 AH.
//  Copyright © 1438 Free Developer. All rights reserved.
//

import UIKit
import RealmSwift


class ProductTableViewController: UITableViewController{

    //Prop: class
    var products: Results<product>!
    let realm = try! Realm()
    var filterString = ""
    var compareName = false
    
    // Get products by category or name
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if compareName {
        products = realm.objects(product.self).filter("name CONTAINS '\(filterString)'")
        } else {
        products = realm.objects(product.self).filter("category CONTAINS '\(filterString)'")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
    // Sec: - Table view customize and data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //  ..........
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as? ProductTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ProductTableViewCell.")
        }

        // Fetches the products data for the data source layout.
     
        let pro = products[indexPath.row]
        cell.productName.text = pro.name
        cell.productPrice.text = String(format: "SR %.2f",pro.price)
        cell.productImage.image = UIImage(data: pro.imageData as! Data)
        return cell
    }
    
    
    // Func: - perform segue to details view when a row selected
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
       self.performSegue(withIdentifier: "tableViewToDetailSegue", sender: self)
    }
    
    
    
    // Func: - prepare details view variables just before segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the index for the selected product
        
        let detailViewController = segue.destination as! DetailsViewController
        let indexpath = tableView.indexPathForSelectedRow
        let selected = products[(indexpath?.row)!]
      
        // Assign selected product data to details view variables
        
        detailViewController.pn = selected.name
        detailViewController.pd = selected.des
        detailViewController.pp = String(format: "%.2f SAR",selected.price)
        detailViewController.pi = UIImage(data: selected.imageData! as Data)
    }
}
