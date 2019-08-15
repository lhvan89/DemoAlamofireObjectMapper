//
//  BaseManager.swift
//  DemoAlamofireObjectMapper
//
//  Created by Van Le on 8/15/19.
//  Copyright © 2019 ITPS. All rights reserved.
//

import Foundation
import Alamofire

class BaseManager: NSObject {
    
    let manager = Alamofire.SessionManager(configuration: .default)
    
    func detechInternetConnection() -> Bool {
        let status  = Reach.sharedInstance.connectionStatus()
        var connected = false
        switch status {
        case .unknown, .offline:
            connected = false
            break
            
        case .online(.wwan):
            connected = true
            break
            
        case .online(.wiFi):
            connected = true
            break
        }
        return connected
    }
}
