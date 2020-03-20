//
//  Mapper.swift
//  cleanswiftData
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation

protocol Mapper {
    associatedtype E
    associatedtype D
    
    func mapFromEntity(type: E) -> D
    func mapToEntity(type: D) -> E
}
