//
//  UserDataStore.swift
//  balaiternakData
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import RxSwift

public protocol UserDataStore {
    func clearUser() -> Completable
    func saveUser(user: UserEntity) -> Completable
    func login(username: String, password: String) -> Observable<UserEntity>
    func getUser(id: String) -> Observable<UserEntity>
    func isCached(id: String) -> Single<Bool>
    func setUserPref(user: UserEntity) -> Observable<UserEntity>
}
