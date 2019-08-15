//
//  Status.swift
//  DemoAlamofireObjectMapper
//
//  Created by Van Le on 8/15/19.
//  Copyright © 2019 ITPS. All rights reserved.
//

import Foundation
import ObjectMapper

class ErrorStatus: Mappable {
    var code: Int = 0
    var message: String = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
    }
}
