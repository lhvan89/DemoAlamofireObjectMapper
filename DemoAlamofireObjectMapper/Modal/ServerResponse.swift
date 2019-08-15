//
//  ServerResponse.swift
//  DemoAlamofireObjectMapper
//
//  Created by Van Le on 8/15/19.
//  Copyright © 2019 ITPS. All rights reserved.
//

import Foundation
import ObjectMapper

class ServerResponse: Mappable {
    var result: AnyObject?
    var success: Bool = false
    var error: ErrorStatus?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        result <- map["result"]
        success <- map["success"]
        error <- map["error"]
    }
}
