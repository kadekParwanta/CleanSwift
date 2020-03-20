//
//  UserDataRepository.swift
//  cleanswiftData
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import RxSwift
import cleanswiftDomain

public struct UserDataRepository: UserRepository {
    let factory: UserDataStoreFactory
    let mapper: UserMapper
    
    public init(factory: UserDataStoreFactory) {
        self.factory = factory
        self.mapper = UserMapper()
    }
    
    
    public func login(username: String, password: String, type: Int) -> Observable<User> {
        return factory.retrieveRemoteDataStore()
            .login(username: username, password: password, type: type)
            .flatMap { self.factory.retrieveCacheDataStore().setUserPref(user: $0) }
            .map { self.mapper.mapFromEntity(type: $0) }
    }
    
    public func clearUser() -> Completable {
        return factory.retrieveCacheDataStore().clearUser()
    }
    
    public func saveUser(user: User) -> Completable {
        return factory.retrieveCacheDataStore().saveUser(user: (mapper.mapToEntity(type: user)))
    }
    
    public func getUser(id: String) -> Observable<User> {
        return factory.retrieveRemoteDataStore().getUser(id: id).map{self.mapper.mapFromEntity(type: $0)}
    }
    
}
