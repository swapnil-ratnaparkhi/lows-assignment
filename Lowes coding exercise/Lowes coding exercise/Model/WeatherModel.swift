//
//  WeatherDataModel.swift
//  Lowes coding exercise
//
//  Created by Swapnil Ratnaparkhi on 2/27/21.
//

import Foundation

struct Main: Decodable {
    let temp: Float
    let temp_max: Float
    let temp_min: Float
    let feels_like: Float
    let humidity: Float
}

struct Weather: Decodable {
    let main: String
    let description: String
    let icon: String
}

struct List: Decodable {
    let main: Main
    let weather: [Weather]
    let dt_txt: String
}

struct WeatherData: Decodable {
    let list: [List]
}


