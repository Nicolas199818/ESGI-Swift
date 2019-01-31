//
//  MemesTableViewCell.swift
//  ESGI-Swift
//
//  Created by Nicolas THIBAULT on 28/01/2019.
//  Copyright © 2019 Nicolas THIBAULT. All rights reserved.
//

import UIKit

class MemesTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeMemes: UILabel!
    @IBOutlet weak var imageMemes: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
