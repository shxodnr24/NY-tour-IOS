//
//  UpperEastRestaurantCell.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2018. 4. 18..
//  Copyright © 2018년 taewook. All rights reserved.
//

import UIKit
import Firebase

class UpperEastTouristAttractionCell: UITableViewCell{

    @IBOutlet weak var addressCell: UILabel!
    @IBOutlet weak var nameCell: UILabel!
    @IBOutlet weak var imageViewCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
