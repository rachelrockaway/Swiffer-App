//
//  SweetTableViewCell.swift
//  SwifferApp
//
//  Created by Rachel Stevenson on 4/22/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import UIKit

class SweetTableViewCell: UITableViewCell {

    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var timestampLabel: UILabel!
    @IBOutlet var sweetTextView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
