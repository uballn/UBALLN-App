//
//  ListTableViewCell.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 4/25/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet var cellAddress: UILabel!
    @IBOutlet var cellDistance: UILabel!
    @IBOutlet var cellAgeTitle: UILabel!
    @IBOutlet var cellAge: UILabel!
    @IBOutlet var cellCountTitle: UILabel!
    @IBOutlet var cellPlayerCount: UILabel!
    @IBOutlet var cellLevelTitle: UILabel!
    @IBOutlet var cellExperience: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellImageView.layer.cornerRadius = 27
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
