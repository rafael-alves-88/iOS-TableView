//
//  MyTableViewCell.swift
//  TabelasCarros
//
//  Created by Thales Toniolo on 9/27/15.
//  Copyright © 2015 Flameworks. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

	@IBOutlet weak var myTitleLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
