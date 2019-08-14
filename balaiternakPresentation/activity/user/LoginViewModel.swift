//
//  LoginViewModel.swift
//  balaiternakPresentation
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import balaiternakDomain
import balaiternakData
import balaiternakCache
import balaiternakRemote

import RxSwift
import RxCocoa

public final class LoginViewModel: ViewModelType {
    
    public struct Input {
        public let userName: Driver<String>
        public let password: Driver<String>
        public let submitTrigger: Driver<Void>
        
        public init(userName: Driver<String>, password: Driver<String>, submitTrigger: Driver<Void>) {
            self.userName = userName
            self.password = password
            self.submitTrigger = submitTrigger
        }
    }
    
    public struct Output {
        public let dismiss: Driver<Void>
    }
    
    let login: Login
    
    public init() {
        let cache = UserCacheImpl()
        let cacheStorage = UserCacheDataStore(cache: cache)
        let remote = UserRemoteImpl()
        let remoteStorage = UserRemoteDataStore(remote: remote)
        let factory = UserDataStoreFactory(cache: cache, cacheDataStore: cacheStorage, remoteDataStore: remoteStorage)
        let userRepo = UserDataRepository(factory: factory)
        self.login = Login(userRepository: userRepo)
    }
    
    public func transform(input: Input) -> Output {
        let usernameAndPassword = Driver.combineLatest(input.userName, input.password)
        let save = input.submitTrigger.withLatestFrom(usernameAndPassword)
            .map { (arg) -> Observable<User> in
                let (username, password) = arg
                return self.login.login(username: username, password: password)
            }.flatMapLatest {_ in
                Driver.just(())
        }
        return Output(dismiss: save)
    }
    

}
