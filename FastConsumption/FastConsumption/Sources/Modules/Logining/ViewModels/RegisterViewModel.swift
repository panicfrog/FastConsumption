//
//  RegisterViewModel.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/7.
//  Copyright © 2017年 Macx. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class RegisterViewModel {
    let checkButtonSelected = Variable(true)

    let phoneValid: Driver<Bool>
    let validCodeValid: Driver<Bool>
    let passwordValid: Driver<Bool>
    let commitButtonEnabled: Driver<Bool>
    
    init(phone: Driver<String>,
         password: Driver<String>,
         validCode: Driver<String>,
         checkAgreement: Driver<Bool>) {
        
        phoneValid = phone.map {
          validatePhonoNum(phono: $0)
        }.asDriver()
        
        passwordValid = password.map {
            validatePassword(passWord: $0)
        }.asDriver()
        
        validCodeValid = validCode.map {
            validateValidcode(validcode: $0)
        }.asDriver()
        
        commitButtonEnabled = Driver.combineLatest(
            phoneValid,
            passwordValid,
            validCodeValid,
            checkButtonSelected.asDriver()
        ) {
            $0 && $1 && $2 && $3
        }.asDriver()

    }
}
