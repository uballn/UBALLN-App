//
//  VideoCell.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 3/15/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
