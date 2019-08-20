//
//  UserCacheDataStore.swift
//  balaiternakData
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import RxSwift

public struct UserCacheDataStore: UserDataStore {
    let cache: UserCache
    
    public init(cache: UserCache) {
        self.cache = cache
    }
    
    public func clearUser() -> Completable {
        return cache.clearUser()
    }
    
    public func saveUser(user: UserEntity) -> Completable {
        return cache.saveUser(user: user)
    }
    
    public func login(username: String, password: String, type: Int) -> Observable<UserEntity> {
        return Observable.error(CustomError.NotSupportedError)
    }
    
    public func getUser(id: String) -> Observable<UserEntity> {
        return cache.getUser(id: id)
    }
    
    public func isCached(id: String) -> Single<Bool> {
        return cache.isCached(id: id)
    }
    
    public func setUserPref(user: UserEntity) -> Observable<UserEntity> {
        return cache.setUserPref(user: user)
    }
    
}
