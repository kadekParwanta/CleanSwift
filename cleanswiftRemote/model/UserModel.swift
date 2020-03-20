//
//  UserModel.swift
//  cleanswiftRemote
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
public struct UserModel : Codable {
    public let id: String
    public let type: String
    public let name: String
    public let username: String
    public let address: String
    public let phone: String
    public let email: String
    public let token: String
    public let firebaseKey: String
    
    enum CodingKeys: String, CodingKey {
        case id, type, name, username, address, phone, email, token
        case firebaseKey = "firebaseKey"
    }
}
