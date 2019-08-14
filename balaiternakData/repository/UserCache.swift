//
//  UserCache.swift
//  balaiternakData
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import RxSwift

public protocol UserCache {
    func clearUser() -> Completable
    func saveUser(user: UserEntity) -> Completable
    func getUser(id: String) -> Observable<UserEntity>
    func isCached(id: String) -> Single<Bool>
    func setLastCacheTime(lastCache: Double) -> Void
    func isExpired() -> Bool
    func setUserPref(user: UserEntity) -> Observable<UserEntity>
    func getUserPref() -> UserEntity
}
