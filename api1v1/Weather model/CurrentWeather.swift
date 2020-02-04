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
    let appearentTemperature: Double
    let humidity: Double
    let pressuare: Double
    let icon: UIImage
    
}

// MARK: Extensions

extension CurrentWeather {
    var pressuareString: String {
        return "\(Int(pressuare)) mm"
    }
    var humidityString: String {
        return "\(Int(humidity))˚C"
    }
    var temperatureString: String {
        return "\(Int(temperature))˚C"
    }
    var appearentTemperatureString: String {
        return "Feels like: \(Int(appearentTemperature))˚C"
    }
    
}
