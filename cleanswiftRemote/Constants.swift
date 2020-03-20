//
//  Constants.swift
//  cleanswiftShared
//
//  Created by Ayu Ratna Wulandari on 20/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
public struct Constants {
    static let baseUrl = "http://18.220.244.194:3000/api"
    
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
    
    public enum ApiError: Error {
        case dataError(response: ApiErrorResponse)   //Status code 400+
        case internalServerError                        //Status code 500
    }
}

public struct ApiErrorResponse: Codable {
    public let status: Int
    public let data: [ErrorMessage]
    public let message: String
}

public struct ErrorMessage: Codable {
    public let error: String
}
