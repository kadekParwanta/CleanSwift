//
//  EntityMapper.swift
//  cleanswiftCache
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation

protocol EntityMapper {
    associatedtype T
    associatedtype V
    
    func mapFromCached(type: T) -> V
    func mapToCached(type: V) -> T
}
