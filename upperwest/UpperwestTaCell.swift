//
//  UpperwestTaCell.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2018. 3. 30..
//  Copyright © 2018년 taewook. All rights reserved.
//

import UIKit

class UpperwestTaCell: UITableViewCell {

    @IBOutlet weak var InfoCell: UILabel!
   
    @IBOutlet weak var imageURLCell: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var LocationCell: UILabel!
    @IBOutlet weak var IDcell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
