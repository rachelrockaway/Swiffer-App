//
//  SweetTableViewCell.swift
//  SwifferApp
//
//  Created by Rachel Stevenson on 4/22/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import UIKit

class SweetTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel! = UILabel()
    @IBOutlet weak var timestampLabel: UILabel! = UILabel()
    @IBOutlet weak var sweetTextView: UITextView! = UITextView()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
