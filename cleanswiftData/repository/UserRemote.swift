//
//  UserRemote.swift
//  cleanswiftData
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import RxSwift

public protocol UserRemote {
    func login(username: String, password: String, type: Int) -> Observable<UserEntity>
    func getUser(id: String) -> Observable<UserEntity>
}
