//
//  DataManager.swift
//  Lowes coding exercise
//
//  Created by Swapnil Ratnaparkhi on 2/28/21.
//

import Foundation

class DataManager {
    let api = API()
    
    func WeatherData(city: String, success: @escaping  (_ weather:WeatherData) -> Void,
                     error: @escaping (_ err:Error) -> Void)  {
        api.getWeatherDataByCity(city: city) { (response) in
            success(response)
        } error: { (err) in
            print(err)
        }
    }
}
