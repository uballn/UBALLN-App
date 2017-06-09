//
//  ListTableView.swift
//  UBALLN Basketball
//
//  Created by Jeremy Gaston on 4/25/17.
//  Copyright © 2017 UBALLN. All rights reserved.
//

import UIKit

class ListTableView: UITableView {

    var imageList = ["24Hr_Fitness_ext-1024x682.jpg","38-basketball.jpg","YMCA-img.jpg","lifetimeentrancesign*750xx1000-563-0-47.jpg"]
    var addressList = ["5100 Belt Line Rd #600","3810 Timberglen Rd","4332 Northaven Rd","3419 Trinity Mills Rd"]
    var distanceList = ["0.1 mi","4.2 mi","4.4 mi","3.7 mi"]
    var ageList = ["Avg. Age  30","Avg. Age  21","Avg. Age  13","Avg. Age  16"]
    var countTitleList = ["Active Players  5","Active Players  18","Active Players  14","Active Players  9"]
    var experienceTitleList = ["Avg. Exp.  2.75","Avg. Exp.  3.50","Avg. Exp.  1.50","Avg. Exp.  2.00"]
    
    override var numberOfSections: Int {
        return 1
    }
    
    override func numberOfRows(inSection section: Int) -> Int {
        return addressList.count
    }
    
    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        let cell = self.dequeueReusableCell(withIdentifier: "locations", for: indexPath) as! ListTableViewCell
        cell.cellAddress.text = addressList[indexPath.row]
        cell.cellDistance.text = distanceList[indexPath.row]
        cell.cellAgeTitle.text = ageList[indexPath.row]
        cell.cellCountTitle.text = countTitleList[indexPath.row]
        cell.cellLevelTitle.text = experienceTitleList[indexPath.row]
        
        cell.cellImageView.image = UIImage(named: imageList[indexPath.row])
        
        return cell
    }

}
