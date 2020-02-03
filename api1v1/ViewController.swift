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



