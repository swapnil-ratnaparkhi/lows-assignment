//
//  API.swift
//  Lowes coding exercise
//
//  Created by Swapnil Ratnaparkhi on 3/1/21.
//

import Foundation

enum ApiError:Error {
      case NoInternetConnection
      case invalidEndpoint
      case ResponseTimeOut
      case noData
}

class API {
    
    private let appId = "65d00499677e59496ca2f318eb68c049"
    private let apiHost = "api.openweathermap.org"
    private let apiPath = "/data/2.5/forecast"
    
    private func getBaseComponent() -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = apiHost
        urlComponents.path = apiPath
        let queryItemUnits = URLQueryItem(name: "units", value: "imperial")
        let queryItemToken = URLQueryItem(name: "appid", value: appId)
        urlComponents.queryItems = [ queryItemUnits, queryItemToken]
        return urlComponents
    }
    
    func getWeatherDataByCity (city: String, success: @escaping  (_ weather:WeatherData) -> Void,
                         error: @escaping (_ err:Error) -> Void) {
        var urlComponents = getBaseComponent()
        let queryItemCity = URLQueryItem(name: "q", value: city)
        urlComponents.queryItems?.append(queryItemCity)
        
        guard let url = urlComponents.url else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return
            }
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let weather =  try decoder.decode(WeatherData.self, from: data)
                DispatchQueue.main.async {
                    success(weather)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
