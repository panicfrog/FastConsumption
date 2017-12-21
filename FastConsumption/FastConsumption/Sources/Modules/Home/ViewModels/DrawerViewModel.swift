//
//  DrawerViewModel.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/21.
//  Copyright © 2017年 Macx. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class DrawerViewModel {
    let placehoderHide: Driver<Bool>
    
    init(bottom: Variable<UIViewController?>) {
        placehoderHide = bottom.asDriver().map {
            $0 != nil
        }.asDriver()
    }
}
