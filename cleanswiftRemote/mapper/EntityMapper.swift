//
//  EntityMapper.swift
//  cleanswiftRemote
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation

protocol EntityMapper {
    associatedtype M
    associatedtype E
    
    func mapFromRemote(type: M) -> E
}
