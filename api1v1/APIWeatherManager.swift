//
//  APIWeatherManager.swift
//  api1v1
//
//  Created by Vadim  Gorbachev on 04.02.2020.
//  Copyright © 2020 Vadim  Gorbachev. All rights reserved.
//

import Foundation

struct Coordinates {
    let latitude: Double
    let longitude: Double
}

enum ForecastType: FinalURLPoint {
    var baseURL: URL {
        return URL(string: "https://api.forecast.io")!
    }
    var path: String {
        switch self {
        case .Current(let apiKey,let coordinates):
            return "/forecast/\(apiKey)/\(coordinates.latitude)/\(coordinates.longitude)"
        }
    }
    var request: URLRequest {
        let url = URL(string: path, relativeTo: baseURL)
        return URLRequest(url: url!)
    }
    
    case Current(apiKey: String, coordinates: Coordinates)
}


final class APIWeatherManager: APIManager {
    
    init(sessionConfiguration: URLSessionConfiguration) {
        <#code#>
    }
    
    func fetch<T>(request: URLRequest, parse: ([String : AnyObject]) -> T?, completionHandler: (APIResult<T>) -> Void) where T : JSONDecodable {
        <#code#>
    }
    
    
    

    let apiKey: String
    let sessionConfiguration: URLSessionConfiguration
    lazy var session: URLSession = {
        return URLSession(configuration: self.sessionConfiguration)
    }()
    
    init(sessionConfiguration: URLSessionConfiguration, apiKey: String) {
    self.sessionConfiguration = sessionConfiguration
    self.apiKey = apiKey
    }
    
    // 
    convenience init(apiKey: String) {
        self.init(sessionConfiguration: URLSessionConfiguration.default, apiKey: apiKey)
    }

    func fetchCurrentWeatherWith(coordinates: Coordinates, completionHandler: @escaping (APIResult<CurrentWeather>) -> Void ) {
        let request = ForecastType.Current(apiKey: self.apiKey, coordinates: coordinates).request
        fetch(request: request, parse: { (json) -> CurrentWeather? in
            if let dictionary = json["currently"] as? [String: AnyObject] {
                return CurrentWeather(JSON: dictionary)
            } else { return nil }
        }, completionHandler: completionHandler)
    }
    
    


}
