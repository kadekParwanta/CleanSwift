//
//  UserMapper.swift
//  cleanswiftData
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import cleanswiftDomain

public struct UserMapper: Mapper {
    typealias E = UserEntity
    typealias D = User
    
    func mapFromEntity(type: UserEntity) -> User {
        return User(id: type.id, firstName: type.firstName)
    }
    
    func mapToEntity(type: User) -> UserEntity {
        return UserEntity(id: type.id, firstName: type.firstName)
    }
    
}
