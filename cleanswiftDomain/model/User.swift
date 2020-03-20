//
//  User.swift
//  cleanswiftDomain
//
//  Created by Ayu Ratna Wulandari on 13/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation

public struct User: Codable {
    public let id: String
    public let firstName: String
    
    public init(id: String, firstName: String) {
        self.id = id
        self.firstName = firstName
    }
}
