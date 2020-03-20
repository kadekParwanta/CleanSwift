//
//  Mapper.swift
//  cleanswiftPresentation
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
protocol Mapper {
    associatedtype V
    associatedtype D
    
    func mapToView(type: D) -> V
}
