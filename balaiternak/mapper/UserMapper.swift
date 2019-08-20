//
//  UserMapper.swift
//  balaiternak
//
//  Created by Ayu Ratna Wulandari on 20/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import balaiternakPresentation

public struct UserMapper: Mapper {
    typealias V = UserViewModel
    typealias D = UserView
    
    func mapToViewModel(type: UserView) -> UserViewModel {
        return UserViewModel(id: type.id, firstName: type.firstName)
    }
    
}
