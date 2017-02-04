//
//  EventTableViewCell.swift
//  Tabbed App Demo
//
//  Created by Administrator on 2/4/17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    @IBOutlet weak var lblEventDate: UILabel!
    
    @IBOutlet weak var lblEventTitle: UILabel!
    
    
    override func awakeFromNib() {

        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
