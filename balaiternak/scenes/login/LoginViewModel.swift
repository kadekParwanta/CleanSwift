//
//  LoginViewModel.swift
//  balaiternak
//
//  Created by Ayu Ratna Wulandari on 20/08/19.
//  Copyright © 2019 Kadek Juliana Parwanta. All rights reserved.
//

import Foundation
import balaiternakPresentation
import RxSwift
import RxCocoa

class LoginViewModel: ViewModelType {
    struct Input {
        let username: Driver<String>
        let password: Driver<String>
        let type: Driver<Int>
        let submitTrigger: Driver<Void>
        
    }
    
    struct Output {
        let signedIn: Driver<UserViewModel>
        let fetching: Driver<Bool>
        let error: Driver<Error>
    }
    
    let login: Login
    let mapper: UserMapper
    
    init() {
        login = Login()
        mapper = UserMapper()
    }
    
    func transform(input: LoginViewModel.Input) -> LoginViewModel.Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        let credentials = Driver.combineLatest(input.username, input.password, input.type)
        let signedIn = input.submitTrigger
            .withLatestFrom(credentials)
            .flatMapLatest {[unowned self] in
                return self.login.execute(params: $0)
                    .map {self.mapper.mapToViewModel(type: $0)}
                    .trackActivity(activityIndicator)
                    .trackError(errorTracker)
                    .asDriverOnErrorJustComplete()
            }
        
        let fetching = activityIndicator.asDriver()
        let errors = errorTracker.asDriver()
        return Output(signedIn: signedIn, fetching: fetching, error: errors)
    }
}
