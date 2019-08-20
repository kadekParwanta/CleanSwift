//
//  UserRepository.swift
//  balaiternakDomain
//
//  Created by Ayu Ratna Wulandari on 13/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import RxSwift

public protocol UserRepository {
    func login(username: String, password: String, type: Int) -> Observable<User>
    func clearUser() -> Completable
    func saveUser(user: User) -> Completable
    func getUser(id: String) -> Observable<User>
}
