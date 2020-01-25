//
//  ViewController.swift
//  finalAssignment_iOS
//
//  Created by Ankita Jain on 2020-01-24.
//  Copyright © 2020 Ankita Jain. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var products: [Product]?
    
    var index1: Int = 1
    var name = " ";
    var id =  0;
    var desc = " ";
    var price = 0.0 ;
   // var id1 = " "
    
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textFields[0].text = "\(id)"
        textFields[1].text = name
        textFields[2].text = desc
        textFields[3].text = "\(price)"
        
        
       
    }
    
    func setIndex(index: Int,data: Int){
        print(data);
        id = data
        products = [Product]()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Products")
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            if results is [NSManagedObject]{
                for result in (results as! [NSManagedObject]) {
                    let pname = result.value(forKey: "name") as! String
                    let pid = result.value(forKey: "id") as! Int16
                    let pdesc = result.value(forKey: "desc") as! String
                    
                    let pprice = result.value(forKey: "price") as! Float
                    
                    if (id == data)
                    {
                        print(id)
                        products?.append(Product(id: Int16(id), name: name, desc: desc, price: Float(price)))
                        name = pname
                        id = Int(pid)
                        desc = pdesc
                        price = Double(pprice)
             
                    }
                    
                    
                }
            }
        } catch  {
            print(error)
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
    
    
    
  
    
    


}

