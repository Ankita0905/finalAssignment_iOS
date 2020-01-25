//
//  Product.swift
//  finalAssignment_iOS
//
//  Created by Ankita Jain on 2020-01-24.
//  Copyright © 2020 Ankita Jain. All rights reserved.
//

import Foundation

class Product
{
    var id : String
        var price : Double
        var name : String
        var desc : String
        
        
        init(id : String,name : String,desc : String, price: Double)
        {
            self.id = id
            self.desc = desc
            self.name = name
            self.price = price
        }
        
        init()
        {
            self.id = String()
            self.desc = String()
            self.name = String()
            self.price = Double()
            
        }
    }
