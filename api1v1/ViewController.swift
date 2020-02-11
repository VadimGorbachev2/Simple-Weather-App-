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
    
    lazy var weatherManager = APIWeatherManager(apiKey: "9a90f273e38f372d2aa5751d44ef0e06")
    let coordinates = Coordinates(latitude: 55.678728, longitude: 37.670680)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.fetchCurrentWeatherWith(coordinates: coordinates) { (result) in
            switch result {
            case .Success(let currentWeather):
                self.updateUIWith(currentWeather: currentWeather)
            case .Failure(let error as NSError):
                let alertController = UIAlertController(title: "Unable to get data", message: "\(error.localizedDescription)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Okey", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            default: break
            }
        }
        
        
        

    }

    
    // MARK: IBActions
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
    }
    
    
    // MARK: methods
    
    func updateUIWith(currentWeather: CurrentWeather) {
        
        self.imageView.image = currentWeather.icon
        self.pressuareLabel.text = currentWeather.pressureString
        self.temperatureLabel.text = currentWeather.temperatureString
        self.appearentTemperatureLabel.text = currentWeather.appearentTemperatureString
        self.humidityLabel.text = currentWeather.humidityString
        
        
    }
}



