//
//  UserRemoteImpl.swift
//  balaiternakRemote
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import balaiternakData
import RxSwift
import Alamofire
import RxAlamofire

public struct UserRemoteImpl: UserRemote {
    private let endPoint: String
    private let mapper: UserMapper
    
    public init() {
        endPoint = Constants.baseUrl
        mapper = UserMapper()
    }
    
    public func login(username: String, password: String, type: Int) -> Observable<UserEntity> {
        let request = ApiRouter.login(username: username, password: password, type: type)
        return RxAlamofire.request(request)
            .debug()
            .data()
            .map { try JSONDecoder().decode(UserModel.self, from: $0)}
            .map { self.mapper.mapFromRemote(type: $0)}
    }
    
    public func getUser(id: String) -> Observable<UserEntity> {
        return Observable.error(CustomError.NotSupportedError)
    }
    
    
}
