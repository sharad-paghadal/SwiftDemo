//
//  cellTableViewCell.swift
//  Table
//
//  Created by Sharad Paghadal on 21/02/17.
//  Copyright © 2017 Sharad Paghadal. All rights reserved.
//

import UIKit

class cellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var osNameLbl: UILabel!
    @IBOutlet weak var founderLbl: UILabel!
    
    var osName : String?{
        didSet{
            osNameLbl.text = osName
        }
    }
    
    var founderName : String?{
        didSet{
            founderLbl.text = founderName
        }
    }
}
