//
//  NibElementTableViewCell.swift
//  AC3.2-MidtermElements
//
//  Created by Victor Zhong on 12/15/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class NibElementTableViewCell: UITableViewCell {
    @IBOutlet weak var elementImage: UIImageView!
    @IBOutlet weak var elementLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
