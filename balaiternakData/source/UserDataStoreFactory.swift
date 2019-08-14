//
//  UserDataStoreFactory.swift
//  balaiternakData
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation

public struct UserDataStoreFactory {
    let cache: UserCache
    let cacheDataStore: UserCacheDataStore
    let remoteDataStore: UserRemoteDataStore
    
    public init(cache: UserCache, cacheDataStore: UserCacheDataStore, remoteDataStore: UserRemoteDataStore) {
        self.cacheDataStore = cacheDataStore
        self.remoteDataStore = remoteDataStore
        self.cache = cache
    }
    
    public func retrieveDataStore(isCached: Bool) -> UserDataStore {
        return isCached && !cache.isExpired() ? retrieveCacheDataStore(): retrieveRemoteDataStore()
    }
    
    public func retrieveRemoteDataStore() -> UserDataStore {
        return remoteDataStore
    }
    
    public func retrieveCacheDataStore() -> UserDataStore {
        return cacheDataStore
    }
}
