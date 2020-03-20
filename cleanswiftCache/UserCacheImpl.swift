//
//  UserCacheImpl.swift
//  cleanswiftCache
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import cleanswiftData
import RxSwift

public struct UserCacheImpl: UserCache {
    
    public init() {
        
    }
    
    public func clearUser() -> Completable {
        return Completable.error(CustomError.NotSupportedError)
    }
    
    public func saveUser(user: UserEntity) -> Completable {
        return Completable.error(CustomError.NotSupportedError)
    }
    
    public func getUser(id: String) -> Observable<UserEntity> {
        return Observable.error(CustomError.NotSupportedError)
    }
    
    public func isCached(id: String) -> Single<Bool> {
        return Single.error(CustomError.NotSupportedError)
    }
    
    public func setLastCacheTime(lastCache: Double) {
        
    }
    
    public func isExpired() -> Bool {
        return true
    }
    
    public func setUserPref(user: UserEntity) -> Observable<UserEntity> {
        return Observable.error(CustomError.NotSupportedError)
    }
    
    public func getUserPref() -> UserEntity {
        return UserEntity(id: "", firstName: "")
    }
    
    
}
