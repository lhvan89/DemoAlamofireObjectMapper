//
//  WeatherResponse.swift
//  DemoAlamofireObjectMapper
//
//  Created by Van Le on 8/15/19.
//  Copyright © 2019 ITPS. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherResponse: Mappable {
    var location: String = ""
    var threeDayForecast: [Forecast] = []
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        location <- map["location"]
        threeDayForecast <- map["three_day_forecast"]
    }
}
