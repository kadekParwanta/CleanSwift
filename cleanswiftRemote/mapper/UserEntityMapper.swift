//
//  UserEntityMapper.swift
//  cleanswiftRemote
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import cleanswiftData

public struct UserMapper: EntityMapper {
    typealias M = UserModel
    typealias E = UserEntity
    
    func mapFromRemote(type: UserModel) -> UserEntity {
        return UserEntity(id: type.id, firstName: type.name)
    }
    
}
