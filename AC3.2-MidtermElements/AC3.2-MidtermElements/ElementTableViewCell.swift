//
//  ElementTableViewCell.swift
//  AC3.2-MidtermElements
//
//  Created by Victor Zhong on 2/15/18.
//  Copyright © 2018 Victor Zhong. All rights reserved.
//

import UIKit

class ElementTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
