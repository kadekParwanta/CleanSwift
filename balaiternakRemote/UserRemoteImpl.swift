//
//  UserRemoteImpl.swift
//  balaiternakRemote
//
//  Created by Ayu Ratna Wulandari on 14/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import balaiternakData
import RxSwift

public struct UserRemoteImpl: UserRemote {
    public init() {
        
    }
    
    public func login(username: String, password: String) -> Observable<UserEntity> {
        return Observable.error(CustomError.NotSupportedError)
    }
    
    public func getUser(id: String) -> Observable<UserEntity> {
        return Observable.error(CustomError.NotSupportedError)
    }
    
    
}
