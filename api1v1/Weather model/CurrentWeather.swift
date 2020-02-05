//
//  CurrentWeather.swift
//  api1v1
//
//  Created by Vadim  Gorbachev on 02.02.2020.
//  Copyright © 2020 Vadim  Gorbachev. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeather {
    let temperature: Double
    let apparentTemperature: Double
    let humidity: Double
    let pressure: Double
    let icon: UIImage
    
}

// MARK: Extensions

extension CurrentWeather {
    var pressureString: String {
        return "\(Int(pressure)) mm"
    }
    var humidityString: String {
        return "\(Int(humidity))˚C"
    }
    var temperatureString: String {
        return "\(Int(temperature))˚C"
    }
    var appearentTemperatureString: String {
        return "Feels like: \(Int(apparentTemperature))˚C"
    }
}

extension CurrentWeather: JSONDecodable {
    init?(JSON: [String : AnyObject]) {
        guard let temperature = JSON["temperature"] as? Double,
            let apparentTemperature = JSON["apparentTemperature"] as? Double,
            let humidity = JSON["humidity"] as? Double,
            let pressure = JSON["pressure"] as? Double,
            let iconString = JSON["icon"] as? String else {
                return nil
        }
        
        let icon = WeatherIconManager(rawValue: iconString).image
        self.temperature = temperature
        self.apparentTemperature = apparentTemperature
        self.humidity = humidity
        self.pressure = pressure
        self.icon = icon
    }
    
    
}
