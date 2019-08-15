//
//  ErrorResponse.swift
//  DemoAlamofireObjectMapper
//
//  Created by Van Le on 8/15/19.
//  Copyright © 2019 ITPS. All rights reserved.
//

import Foundation

enum ErrorResponse: Error {
    case success                    //200
    case created                    //201
    case accepted                   //202
    case deleted                    //204
    case notModified                //304
    case unAuthorized               //400
    case forbidden                  //403
    case notFound                   //404
    case methodNotAllowed           //405
    case conflict                   //409
    case authenticationTimeout      //419
    case unprocessableEntity        //422
    case tooManyRequest             //429
    case gateWayTimeout             //504
    case noNetwork                  //999
    case none
}

open class ErrorResponseFromCode {
    static func errorFromCode(_ errorCode: Int) -> ErrorResponse {
        switch errorCode {
        case 200:
            return .success
        case 201:
            return .created
        case 202:
            return .accepted
        case 204:
            return .deleted
        case 304:
            return .notModified
        case 400:
            return .unAuthorized
        case 403:
            return .forbidden
        case 404:
            return .notFound
        case 405:
            return .methodNotAllowed
        case 409:
            return .conflict
        case 419:
            return .authenticationTimeout
        case 422:
            return .unprocessableEntity
        case 429:
            return .tooManyRequest
        case 504:
            return .gateWayTimeout
        case 999:
            return .noNetwork
        default:
            return .none
        }
    }
}
