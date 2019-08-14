//
//  UserEntityMapper.swift
//  balaiternakCache
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import balaiternakData

public struct UserEntityMapper: EntityMapper {
    typealias T = CachedUser
    typealias V = UserEntity
    
    func mapFromCached(type: CachedUser) -> UserEntity {
        return UserEntity(id: type.id, firstName: type.firstName)
    }
    
    func mapToCached(type: UserEntity) -> CachedUser {
        return CachedUser(id: type.id, firstName: type.firstName)
    }
    
}
