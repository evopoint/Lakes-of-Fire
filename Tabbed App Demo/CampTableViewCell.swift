//
//  CampTableViewCell.swift
//  Tabbed App Demo
//
//  Created by Administrator on 2/4/17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit

class CampTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var lblCampCell: UILabel!
    
    @IBOutlet weak var lblCampDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
