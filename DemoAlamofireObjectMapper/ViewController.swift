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
        
        login(userName: "+portal@itpsolution.net", password: "Thu234567")
    }
    
    func login(userName: String, password: String) {
        let url = "http://oplusapi.itpsolution.net/api/TokenAuth/Authenticate"
        let params: Parameters = ["+userNameOrEmailAddress": userName, "password": password]
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        DataManager.sharedInstance.executeRequest(url, method: .post, params: params, headers: headers) { (serverResponse, error, errorMessage) in
            if error == .success {
                
            } else {
                print(errorMessage)
            }
        }
    }
}
