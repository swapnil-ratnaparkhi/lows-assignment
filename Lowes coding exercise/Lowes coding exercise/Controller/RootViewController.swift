//
//  RootViewController.swift
//  Lowes coding exercise
//
//  Created by Swapnil Ratnaparkhi on 2/28/21.
//

import UIKit

class RootViewController: UIViewController {

// MARK: - Outlet
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var enterCityTextField: UITextField!
    
    let viewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetup()
    }
    
    private func initialUISetup () {
        searchButton.layer.cornerRadius = 10.0
        searchButton.layer.borderColor = UIColor.white.cgColor
        searchButton.layer.borderWidth = 1.0
    }

// MARK: - Action Method
    @IBAction func searchButtonAction(_ sender: Any) {
        guard let cityName = enterCityTextField.text else {
            return
        }
        
        viewModel.WeatherData(city: cityName) { (response) in
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "datavc") as? WeatherViewController {
                viewController.weatherList = response
                self.present(viewController, animated: true, completion: nil)
            }
            
        } error: { (error) in
            print(error)
        }
    }
}
