//
//  RetrievePasswordViewModel.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/7.
//  Copyright © 2017年 Macx. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class RetrievePasswordViewModel {
    let phoneValided: Driver<Bool>
    let validCodeValided: Driver<Bool>
    
    init(phone: Driver<String>, validCode: Driver<String>) {
        phoneValided = phone.map {
            validatePhonoNum(phono: $0)
        }.asDriver()
        
        validCodeValided = validCode.map {
            validateValidcode(validcode: $0)
        }.asDriver()
    }
    
    
}
