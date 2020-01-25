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
     internal init(id: Int16, name: String, desc: String, price: Float) {
            self.id = id
            self.name = name
            self.desc = desc
            self.price = price
        }
        
        
        var id : Int16
        var name : String
        var desc : String
        var price : Float
        
    }
