//
//  WeatherViewController.swift
//  Lowes coding exercise
//
//  Created by Swapnil Ratnaparkhi on 2/27/21.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
// MARK: - Member Variable
    var cellIdentifier = "cell"
    var weatherList = [List]()
    
// MARK: - Outlet
    @IBOutlet weak var weatherTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    private func initialSetup() {
        //UI setup
        weatherTableView.tableFooterView = UIView()
        weatherTableView.estimatedRowHeight = 200
    }
}

extension WeatherViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return weatherList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell: WeatherCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! WeatherCell
    cell.date.text = String(weatherList[indexPath.row].dt_txt)
    cell.weatherImageView.image = UIImage(named: weatherList[indexPath.row].weather[0].icon + ".png")
    cell.weatherDescription.text = (weatherList[indexPath.row].weather[0].description).localizedCapitalized
    cell.temp.text = String(weatherList[indexPath.row].main.temp)
    return cell
  }
}

//MARK:- UITableViewDelegate Extension
extension WeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        weatherTableView.deselectRow(at: indexPath, animated: true)
        if let weatherDetailViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "weathervc") as? WeatherDetailViewController {
            weatherDetailViewController.weatherList = weatherList[indexPath.row]
            self.present(weatherDetailViewController, animated: true, completion: nil)
        }
        
        
    }
}
