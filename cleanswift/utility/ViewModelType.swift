//
//  ViewModelType.swift
//  cleanswift
//
//  Created by Ayu Ratna Wulandari on 20/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
