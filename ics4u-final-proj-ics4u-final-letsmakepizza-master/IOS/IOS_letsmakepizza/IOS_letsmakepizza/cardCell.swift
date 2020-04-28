//
//  cardCell.swift
//  IOS_letsmakepizza
//
//  Created by Jiaying Cui on 2019-06-08.
//  Copyright © 2019 ICS4UI. All rights reserved.
//

import UIKit

class cardCell: UITableViewCell {
    
    @IBOutlet weak var card1: cardButton!
    
    @IBOutlet weak var card2: cardButton!
    
    
    @IBOutlet weak var card3: cardButton!

    @IBOutlet weak var oven1: UIImageView!
    @IBOutlet weak var oven2: UIImageView!
    @IBOutlet weak var oven3: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    }

