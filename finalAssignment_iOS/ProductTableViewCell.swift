//
//  ProductTableViewCell.swift
//  finalAssignment_iOS
//
//  Created by Ankita Jain on 2020-01-25.
//  Copyright © 2020 Ankita Jain. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

  @IBOutlet weak var lbl2: UILabel!
    
    @IBOutlet weak var lbl1: UILabel!
       
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

    }
