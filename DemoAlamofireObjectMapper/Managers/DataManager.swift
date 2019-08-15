//
//  DataManager.swift
//  DemoAlamofireObjectMapper
//
//  Created by Van Le on 8/15/19.
//  Copyright © 2019 ITPS. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class DataManager: BaseManager {
    
    static let sharedInstance: DataManager = {
        
        return DataManager()
    }()
    
    func executeRequest(_ url: String, method: HTTPMethod, params: Parameters, headers: HTTPHeaders, completionHandler: ((_ data: ServerResponse?, _ error: ErrorResponse, _ errorMessage: String?) -> Void)?) {
        
        guard detechInternetConnection() else {
            guard let completionHandler = completionHandler else { return }
            completionHandler(nil, .noNetwork, "Kết nối mạng đang gặp vấn đề, làm ơn thử lại")
            return
        }
        
        var finalHeader: HTTPHeaders = [kContentTypeKey: kContentTypeValue]
        if Settings.isLogin == true {
            if let token = Settings.token {
                finalHeader.addObjectsFromDictionary([kTokenKey: token])
            }
        }
        
        if headers.count > 0 {
            finalHeader.addObjectsFromDictionary(headers)
        }
        
        Alamofire.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: finalHeader).responseObject { (response: DataResponse<ServerResponse>) in
            
            
            guard let dataResponse = response.data, let dataJson = String(data: dataResponse, encoding: .utf8) else {return }
            guard let jsonResponse = dataJson.data(using: .utf8)?.prettyPrintedJSONString else { return }
            print("====================")
            print("API =", url)
            print("Headers =", finalHeader)
            print("Params =", params)
            print("Response =", jsonResponse)
            print("====================")
            
            guard let completionHandler = completionHandler else { return }
            
            if response.result.isSuccess {
                guard let resultValue = response.result.value else {
                    completionHandler(nil, .none, "Không có dữ liệu trả về")
                    return
                }
                
                if resultValue.success {
                    completionHandler(resultValue, .success, nil)
                } else {
                    completionHandler(resultValue, .none, nil)
                }
                
                
            } else {
                print("Error result: \(String(describing: response.result.error))")
                if let error = response.result.error {
                    completionHandler(nil, .none, error.localizedDescription)
                } else {
                    completionHandler(nil, .none, "Unknown error")
                }
            }
            
            
        }
    }
}
