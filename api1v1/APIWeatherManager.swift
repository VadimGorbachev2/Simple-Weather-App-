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

enum ForecastType {
    case Current(apiKey: String, coordinates: Coordinates)
}


//final class APIWeatherManager: APIManager {
//
//    let apiKey: String
//    let sessionConfiguration: URLSessionConfiguration
//    lazy var session: URLSession = {
//        return URLSession(configuration: self.sessionConfiguration)
//    }()
//
//    init(sessionConfiguration: URLSessionConfiguration, apiKey: String) {
//        self.sessionConfiguration = sessionConfiguration
//        self.apiKey = apiKey
//    }
//
//    convenience init(apiKey: String) {
//        self.init(sessionConfiguration: URLSessionConfiguration.default, apiKey: apiKey)
//    }
//
//    func fetchCurrentWeather(coordinates: Coordinates, completionHandler: (APIResult<CurrentWeather>) -> Void ) {
//
//    }
//
//
//}
