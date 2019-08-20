//
//  Login.swift
//  balaiternakDomain
//
//  Created by Ayu Ratna Wulandari on 13/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import RxSwift

public struct UserDomain {
    let userRepository: UserRepository
    
    public init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    public func login(username: String, password: String) -> Observable<User> {
        return userRepository.login(username: username, password: password)
    }
}
