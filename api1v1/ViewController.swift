//
//  ViewController.swift
//  api1v1
//
//  Created by Vadim  Gorbachev on 16.01.2020.
//  Copyright © 2020 Vadim  Gorbachev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOuthlets

    @IBOutlet weak var locationLabel: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pressuareLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var appearentTemperatureLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let icon = WeatherIconManager.Rain.image
        let currentWeather = CurrentWeather(temperature: 10, appearentTemperature: 5, humidity: 70, pressuare: 750, icon: icon)
        updateUIWith(currentWeather: currentWeather)
        
//         // wrong way
//
//        let urlString = "https://api.darksky.net/forecast/9a90f273e38f372d2aa5751d44ef0e06/37.8267,-122.4233"
//        let baseURL = URL(string: "https://api.darksky.net/forecast/9a90f273e38f372d2aa5751d44ef0e06/")
//        let fullURL = URL(string: "37.8267,-122.4233", relativeTo: baseURL)
//
//        let sessionConfiguration = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfiguration)
//        let request = URLRequest(url: fullURL!)
//        let dataTask = session.dataTask(with: fullURL!) { (data, respose, errror) in
//
//        }
//        dataTask.resume() /
    }

    
    // MARK: IBActions
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
    }
    
    
    // MARK: methods
    
    func updateUIWith(currentWeather: CurrentWeather) {
        
        self.imageView.image = currentWeather.icon
        self.pressuareLabel.text = currentWeather.pressuareString
        self.temperatureLabel.text = currentWeather.temperatureString
        self.appearentTemperatureLabel.text = currentWeather.appearentTemperatureString
        self.humidityLabel.text = currentWeather.humidityString
        
        
    }
}



