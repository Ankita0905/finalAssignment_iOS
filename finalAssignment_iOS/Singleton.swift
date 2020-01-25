//
//  Singleton.swift
//  finalAssignment_iOS
//
//  Created by Ankita Jain on 2020-01-24.
//  Copyright © 2020 Ankita Jain. All rights reserved.
//

import Foundation

class Singleton: NSObject
{
     private var productArray  = [Product]()
    
    private static var obj = Singleton()
    
    
    private override init() {
        
    }
    
    internal static func getInstance() -> Singleton
    {
        return obj
    }
    
//    func addNewCu(First_Name : String, Last_Name : String, email : String)
//    {
//        let c = customerDictionary.count + 1
//
//        let temp = Customer(customerID: c, customerFName: First_Name, customerLName: Last_Name, customerEmail: email)
//        self.AddCustomer(customer: temp)
//    }
    
    func returnProductArray() -> [Product]
{
    return productArray
    }
    func returnProductObject() -> Product?
    {
        for product in productArray
        {
           return product
        }
        return nil
        
    }
    
    func returnCount() -> Int
    {
        return productArray.count
    }
    
    func AddProduct(product: Product)
       {
           productArray.append(product)
       }
    
    func createProduct()
    {
        let p1 = Product(id: 121, name: "Mobile", desc: "Iphone", price: 2000.0)
        
        let p2 = Product(id: 122, name: "Mobile", desc: "Samsung", price: 2000.0)
        
        let p3 = Product(id: 123, name: "Mobile", desc: "Oppo", price: 2000.0)
        
        let p4 = Product(id: 124, name: "Mobile", desc: "Iphone X", price: 2000.0)
        
        let p5 = Product(id: 125, name: "Mobile", desc: "Iphone XR", price: 2000.0)
        
        let p6 = Product(id: 126, name: "Mobile", desc: "Iphone 11", price: 2000.0)
        
        let p7 = Product(id: 127, name: "Mobile", desc: "Iphone 11 Pro", price: 2000.0)
        
        let p8 = Product(id: 128, name: "Mobile", desc: "Iphone 7", price: 2000.0)
        
        let p9 = Product(id: 129, name: "Mobile", desc: "Iphone 6", price: 2000.0)
        
        let p10 = Product(id: 130, name: "Mobile", desc: "Iphone 8", price: 2000.0)
        
        AddProduct(product: p1)
        AddProduct(product: p2)
        AddProduct(product: p3)
        AddProduct(product: p4)
        AddProduct(product: p5)
        AddProduct(product: p6)
        AddProduct(product: p7)
        AddProduct(product: p8)
        AddProduct(product: p9)
        AddProduct(product: p10)
   
//    func printdata()
//    {
//        for i in customerDictionary.values
//        {
//            print(i.customerFName!)
//        }
//    }
    }

}
