//
//  UserRemoteImpl.swift
//  cleanswiftRemote
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import cleanswiftData
import RxSwift
import Alamofire
import RxAlamofire

public struct UserRemoteImpl: UserRemote {
    private let endPoint: String
    private let mapper: UserMapper
    private let apiClient: ApiClient
    
    public init() {
        endPoint = Constants.baseUrl
        mapper = UserMapper()
        apiClient = ApiClient()
    }
    
    public func login(username: String, password: String, type: Int) -> Observable<UserEntity> {
        let request = ApiRouter.login(username: username, password: password, type: type)
        return apiClient.getResponseObject(type: UserModel.self, request: request)
            .map { self.mapper.mapFromRemote(type: $0)}
    }
    
    public func getUser(id: String) -> Observable<UserEntity> {
        return Observable.error(Constants.ApiError.internalServerError)
    }
    
    
}
