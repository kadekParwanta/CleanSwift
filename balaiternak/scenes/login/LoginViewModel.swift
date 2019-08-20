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
        let username: Observable<String>
        let password: Observable<String>
        let submitTrigger: Driver<Void>
        
    }
    
    struct Output {
        let dismiss: Driver<UserViewModel>
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
        let usernameAndPass = Observable.combineLatest(input.username, input.password)
        let save = input.submitTrigger.asObservable()
            .withLatestFrom(usernameAndPass)
            .flatMapLatest {
                self.login.execute(params: $0).trackActivity(activityIndicator).trackError(errorTracker)
            }.map {
                self.mapper.mapToViewModel(type: $0)
            }
            .asDriverOnErrorJustComplete()
        let fetching = activityIndicator.asDriver()
        let errors = errorTracker.asDriver()
        return Output(dismiss: save, fetching: fetching, error: errors)
    }
}
