//
//  UserUseCase.swift
//  balaiternakPresentation
//
//  Created by Ayu Ratna Wulandari on 20/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import balaiternakDomain
import balaiternakData
import balaiternakCache
import balaiternakRemote
import RxSwift

public protocol UseCaseProtocol {
    associatedtype T
    associatedtype P
    func execute(params: P) -> Observable<T>
}

public class UserUseCase {
    
    let domain: UserDomain
    let scheduler: ConcurrentDispatchQueueScheduler
    let mapper: UserMapper
    
    public init() {
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
        self.mapper = UserMapper()
        let cache = UserCacheImpl()
        let cacheStorage = UserCacheDataStore(cache: cache)
        let remote = UserRemoteImpl()
        let remoteStorage = UserRemoteDataStore(remote: remote)
        let factory = UserDataStoreFactory(cache: cache, cacheDataStore: cacheStorage, remoteDataStore: remoteStorage)
        let userRepo = UserDataRepository(factory: factory)
        self.domain = UserDomain(userRepository: userRepo)
    }
    
}
