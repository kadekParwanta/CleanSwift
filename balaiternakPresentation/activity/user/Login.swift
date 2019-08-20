//
//  Login.swift
//  balaiternakPresentation
//
//  Created by Ayu Ratna Wulandari on 20/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import RxSwift

public class Login: UserUseCase, UseCaseProtocol {
    
    public typealias T = UserView
    public typealias P  = (String,String)
    
    public func execute(params: (String,String)) -> Observable<UserView> {
        return self.domain.login(username: params.0, password: params.1)
        .observeOn(scheduler).map {self.mapper.mapToView(type: $0)}
    }
}