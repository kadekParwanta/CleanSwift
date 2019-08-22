//
//  ApiClient.swift
//  balaiternakRemote
//
//  Created by Ayu Ratna Wulandari on 20/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import balaiternakData
import RxSwift
import Alamofire
import RxAlamofire

class ApiClient {
    
    public func getResponseArray<T:Codable>(type:T.Type, request: URLRequestConvertible) -> Observable<[T]> {
        let req = RxAlamofire.request(request).debug()
        let observable = req.flatMap {
            $0.rx_responseArray(type: T.self)
        }
        
        return observable
    }
    
    public func getResponseObject<T:Codable>(type:T.Type, request: URLRequestConvertible) -> Observable<T> {
        let req = RxAlamofire.request(request).debug()
        let observable = req.flatMap {
            $0.rx_responseObject(type: T.self)
        }
        
        return observable
    }
}

