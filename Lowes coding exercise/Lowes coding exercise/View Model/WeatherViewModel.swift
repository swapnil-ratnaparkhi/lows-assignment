//
//  WeatherViewModel.swift
//  Lowes coding exercise
//
//  Created by Swapnil Ratnaparkhi on 2/28/21.
//

import Foundation

class WeatherViewModel {
    let manager = DataManager()
    
    //MARK:- Lifecycle methods
    init() {}
    
    //MARK:- Get the weatherData
    
    func WeatherData(city: String, success: @escaping  (_ weather:[List]) -> Void,
                     error: @escaping (_ err:Error) -> Void) {
        manager.WeatherData(city: city) { (response) in
            var weatherList = [List]()
            
            for i in 0..<response.list.count {
                weatherList.append(response.list[i])
            }
            success(weatherList)
        } error: { (err) in
            print(err)
        }
    }
}
