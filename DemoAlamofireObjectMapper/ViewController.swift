//
//  ViewController.swift
//  DemoAlamofireObjectMapper
//
//  Created by Van Le on 8/15/19.
//  Copyright © 2019 ITPS. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadAPI()
    }
    
    func loadAPI() {
        let url = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
        Alamofire.request(url).responseObject { (response: DataResponse<WeatherResponse>) in
            
            guard let weatherResponse = response.result.value else { return }

            print(weatherResponse.location)
            
            let threeDayForecast = weatherResponse.threeDayForecast
            for forecast in threeDayForecast {
                print(forecast.day)
                print(forecast.temperature)
            }
        }
    }
}
