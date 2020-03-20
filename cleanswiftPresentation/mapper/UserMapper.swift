//
//  UserMapper.swift
//  cleanswiftPresentation
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import cleanswiftDomain

public struct UserMapper: Mapper {
    typealias V = UserView
    typealias D = User
    
    func mapToView(type: User) -> UserView {
        return UserView(id: type.id, firstName: type.firstName)
    }
    
}
