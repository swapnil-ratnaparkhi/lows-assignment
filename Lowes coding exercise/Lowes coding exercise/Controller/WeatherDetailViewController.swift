//
//  WeatherDetailViewController.swift
//  Lowes coding exercise
//
//  Created by Swapnil Ratnaparkhi on 3/1/21.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    // MARK: - Member Variable
    var weatherList:List?
    
    // MARK: - IBOutlet
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateData()
    }
    
    private func populateData() {
        guard let list = weatherList else {
            return
        }
        
        weatherImageView.image = UIImage(named: list.weather[0].icon + ".png")
        temp.text = String(list.main.temp)
        feelsLike.text = String(list.main.feels_like)
        weatherDescription.text = list.weather[0].description.localizedCapitalized
    }
}
