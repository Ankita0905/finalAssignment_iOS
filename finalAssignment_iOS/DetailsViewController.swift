//
//  DetailsViewController.swift
//  finalAssignment_iOS
//
//  Created by Ankita Jain on 2020-01-25.
//  Copyright © 2020 Ankita Jain. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var product : Product?

        @IBOutlet weak var descTxt: UITextView!
        @IBOutlet weak var nameLbl: UILabel!
        @IBOutlet weak var idLbl: UILabel!
        @IBOutlet weak var priceLbl: UILabel!
        override func viewDidLoad() {
            super.viewDidLoad()
            nameLbl.text = product!.name
            
            descTxt.text = product!.desc
            
            idLbl.text = String(product!.id)

            priceLbl.text = " \(product!.price)"
            
            

            // Do any additional setup after loading the view.
        }
        

        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }
