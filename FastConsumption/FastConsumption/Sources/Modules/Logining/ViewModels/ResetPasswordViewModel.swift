//
//  ResetPasswordViewModel.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/7.
//  Copyright © 2017年 Macx. All rights reserved.
//

import Foundation
import RxCocoa
import Rswift

class ResetPasswordViewModel {
    let passwordValid: Driver<Bool>
    
    init(password: Driver<String>) {
        passwordValid = password.map {
            validatePassword(passWord: $0)
        }.asDriver()
    }
}
