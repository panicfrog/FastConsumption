//
//  SideViewModel.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/20.
//  Copyright © 2017年 Macx. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum SideSelected {
    case myLoan
    case myCards
    case myValidate
    case commonProblem
    case exitAccount
}

class SideViewModel {
    var sideSelected: Variable<SideSelected> = Variable(.myLoan)
    
    ///output
    let myLoanSelected: Driver<Bool>
    let myCardsSelected: Driver<Bool>
    let myValidateSelected: Driver<Bool>
    let myCommonProblemSelected: Driver<Bool>
    let exitAccountSelected: Driver<Bool>
    
    init() {
        myLoanSelected = sideSelected.asDriver().map {
            $0 == .myLoan
            }.asDriver()
        myCardsSelected = sideSelected.asDriver().map {
            $0 == .myCards
            }.asDriver()
        myValidateSelected = sideSelected.asDriver().map {
            $0 == .myValidate
            }.asDriver()
        myCommonProblemSelected = sideSelected.asDriver().map {
            $0 == .commonProblem
            }.asDriver()
        exitAccountSelected = sideSelected.asDriver().map {
            $0 == .exitAccount
            }.asDriver()
    }
}
