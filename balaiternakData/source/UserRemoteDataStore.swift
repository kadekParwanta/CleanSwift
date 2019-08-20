//
//  UserRemoteDataStore.swift
//  balaiternakData
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import RxSwift

public struct UserRemoteDataStore: UserDataStore {
    
    let remote: UserRemote
    
    public init(remote: UserRemote) {
        self.remote = remote
    }
    
    public func clearUser() -> Completable {
        return Completable.error(CustomError.NotSupportedError)
    }
    
    public func saveUser(user: UserEntity) -> Completable {
        return Completable.error(CustomError.NotSupportedError)
    }
    
    public func login(username: String, password: String, type: Int) -> Observable<UserEntity> {
        return remote.login(username: username, password: password, type: type)
    }
    
    public func getUser(id: String) -> Observable<UserEntity> {
        return remote.getUser(id: id)
    }
    
    public func isCached(id: String) -> Single<Bool> {
        return Single.error(CustomError.NotSupportedError)
    }
    
    public func setUserPref(user: UserEntity) -> Observable<UserEntity> {
        return Observable.error(CustomError.NotSupportedError)
    }
    
    
}
