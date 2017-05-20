//
//  SettingCell.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 3/15/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit

class SettingCell: BaseCell {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.black : UIColor.white
            nameLabel.textColor = isHighlighted ? UIColor.white : UIColor.darkGray
            iconImageView.tintColor = isHighlighted ? UIColor.white : UIColor.darkGray
        }
    }
    
    var setting:Setting? {
        didSet {
            nameLabel.text = setting?.name
            
            if let imageName = setting?.imageName {
                iconImageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
                iconImageView.tintColor = UIColor.darkGray
            }
        }
    }
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Share"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let iconImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "share")
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(nameLabel)
        addSubview(iconImageView)
        
        addConstraintsWithFormat("H:|-24-[v0(24)]-24-[v1]|", views: iconImageView, nameLabel)
        
        addConstraintsWithFormat("V:|[v0]|", views: nameLabel)
        
        addConstraintsWithFormat("V:[v0(24)]", views: iconImageView)
        
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
