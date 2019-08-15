//
//  Settings.swift
//  DemoAlamofireObjectMapper
//
//  Created by Van Le on 8/15/19.
//  Copyright © 2019 ITPS. All rights reserved.
//

import Foundation

class Settings: NSObject {
    
    fileprivate static let kSettingToken = "ToKeN"
    
    static var isLogin: Bool? {
        get {
            return UserDefaults.standard.object(forKey: kIsLogin) as? Bool
        }
        set {
            UserDefaults.standard.set(newValue ?? false, forKey: kIsLogin)
            UserDefaults.standard.synchronize()
        }
    }
    
    static var token: String? {
        get {
            return UserDefaults.standard.object(forKey: kSettingToken) as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: kSettingToken)
            UserDefaults.standard.synchronize()
        }
    }
}
