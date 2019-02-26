//
//  FoodNameTableViewCell.swift
//  StretchySnacks
//
//  Created by Van Luu on 2019-02-21.
//  Copyright © 2019 Van Luu. All rights reserved.
//

import UIKit

class FoodNameTableViewCell: UITableViewCell {
    @IBOutlet weak var foodNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
