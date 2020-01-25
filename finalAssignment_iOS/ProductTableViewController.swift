//
//  ProductTableViewController.swift
//  finalAssignment_iOS
//
//  Created by Ankita Jain on 2020-01-24.
//  Copyright © 2020 Ankita Jain. All rights reserved.
//

import UIKit
import CoreData
class ProductTableViewController: UITableViewController, UISearchBarDelegate {
var products : [Product]?

     var temp = Singleton.getInstance()
    
    @IBOutlet var tableView1: UITableView!
    var issearch=false;
        var searcharray : [Product] = [];
    var items: [Product] = [];
    @IBOutlet weak var search: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        temp.createProduct()
 //       print(temp.returnProductObj())
        products = temp.returnProductArray()
       saveCoreData()
        tableView.reloadData()
    }
    
    
    func saveCoreData(){
//    clearCoreData()
         let appDelegate = UIApplication.shared.delegate as! AppDelegate

         let managedContext = appDelegate.persistentContainer.viewContext
         
         for  product in products!
         {
             let productEntity = NSEntityDescription.insertNewObject(forEntityName: "Products", into: managedContext)
            productEntity.setValue(product.name, forKey: "name")
           // print(product.Product_Name)
            productEntity.setValue(product.desc, forKey: "desc")
            productEntity.setValue(product.id, forKey: "id")
            productEntity.setValue(product.price, forKey: "price")
             
             // save context
             do{
                 try managedContext.save()
             }catch{
                 print(error)
             }
         }
     }
     
    
    
    func loadCoreData(){
        products = [Product]()
       saveCoreData()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
       
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Products")
        
        do{
            let results = try managedContext.fetch(fetchRequest)
            if results is [NSManagedObject]{
                for result in results as! [NSManagedObject]{
                    let name = result.value(forKey: "name") as! String
                    let desc = result.value(forKey: "desc") as! String
                    let id = result.value(forKey: "id") as! Int
                    let price = result.value(forKey: "price") as! Int
                    products?.append(Product(id: Int16(id), name: name, desc: desc, price: Float(price)))
                }
            }
        }catch{
            print(error)
        }
        
    }
    
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products?.count ?? 0
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let product = products![indexPath.row]
               let cell = tableView.dequeueReusableCell(withIdentifier: "productCell")
        
        if issearch
        {
        cell?.textLabel?.text = "\(product.id )" + " - " + "\(product.name)"
        cell?.detailTextLabel?.text = "\(product.desc) - \(product.price)"
        
              
        }
        else{
             cell?.textLabel?.text = "\(product.id )" + " - " + "\(product.name)"
                    cell?.detailTextLabel?.text = "\(product.desc) - \(product.price)"
                    
        }
         return cell!
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
       {
           let filtered = items.filter { $0.name.lowercased().contains(searchText.lowercased()) || $0.desc.lowercased().contains(searchText.lowercased())}
                   
           if filtered.count>0
           {
               searcharray  = filtered;
               issearch = true;
           }
           else
           {
               issearch = false;
           }
           self.tableView1.reloadData();
       }
       
       func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool
       {
           return true;
       }
      
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

                  
                  if let controller = segue.destination as? ViewController
                          {
                              let productIndexPath = self.tableView.indexPath(for: (sender as! UITableViewCell))!
                              let object = products![productIndexPath.row]
                            controller.setIndex(index: productIndexPath.row ,data: Int(object.id))
                              
                          
                      }
                  
              }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
