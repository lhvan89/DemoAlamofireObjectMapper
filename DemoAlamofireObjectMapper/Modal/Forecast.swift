//
//  Forecast.swift
//  DemoAlamofireObjectMapper
//
//  Created by Van Le on 8/15/19.
//  Copyright © 2019 ITPS. All rights reserved.
//

import Foundation
import ObjectMapper

class Forecast: Mappable {
    var day: String = ""
    var temperature: Int = 0
    var conditions: String = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <- map["conditions"]
    }
}
