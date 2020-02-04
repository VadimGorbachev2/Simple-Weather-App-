//
//  WeatherIconManager.swift
//  api1v1
//
//  Created by Vadim  Gorbachev on 02.02.2020.
//  Copyright © 2020 Vadim  Gorbachev. All rights reserved.
//

import Foundation
import UIKit

enum WeatherIconManager: String {
    
    case ClearDay = "clear-day"
    case ClearNigth = "clear-nigth"
    case Rain = "rain"
    case Snow = "snow"
    case Sleet = "sleet"
    case Wind = "wind"
    case Fog = "fog"
    case Cloudy = "cloudy"
    case PartlyCloudyDay = "partly-cloudy-day"
    case PartlyCloudyNight = "partly-cloudy-night"
    case UnpredicatedIcon = "unpredicated-icon"
    
    
    init(rawValue: String) {
        switch rawValue {
        case "clear-day": self = .ClearDay
        case "clear-night": self = .ClearNigth
        case "rain": self = .Rain
        case "snow": self = .Snow
        case "wind": self = .Wind
        case "fog": self = .Fog
        case "Cloudy": self = .Cloudy
        case "partly-cloudy-day": self = .PartlyCloudyDay
        case "partly-cloudy-night": self = .PartlyCloudyNight
        default: self = .UnpredicatedIcon
        }
    }
        
}


// MARK: Extensions 

extension WeatherIconManager {
    
    var image: UIImage {
        return UIImage(named: self.rawValue)!
    }
}
