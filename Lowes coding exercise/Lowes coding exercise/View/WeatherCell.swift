//
//  WeatherCell.swift
//  Lowes coding exercise
//
//  Created by Swapnil Ratnaparkhi on 3/1/21.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temp: UILabel!
    
    @IBOutlet weak var weatherDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
