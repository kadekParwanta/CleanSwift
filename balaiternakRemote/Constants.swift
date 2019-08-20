//
//  Constants.swift
//  balaiternakRemote
//
//  Created by Ayu Ratna Wulandari on 20/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
struct Constants {
    static let baseUrl = "http://18.220.244.194/api"
    
    //The parameters (Queries) that we're gonna use
    struct Parameters {
        static let username = "username"
        static let password = "password"
        static let type = "type"
        static let appType = "app_type"
    }
    
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
    }
    
    enum ApiError: Error {
        case forbidden              //Status code 403
        case notFound               //Status code 404
        case conflict               //Status code 409
        case internalServerError    //Status code 500
    }
}
