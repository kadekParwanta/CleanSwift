//
//  Mapper.swift
//  balaiternak
//
//  Created by Ayu Ratna Wulandari on 20/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
protocol Mapper {
    associatedtype V
    associatedtype D
    
    func mapToViewModel(type: D) -> V
}
