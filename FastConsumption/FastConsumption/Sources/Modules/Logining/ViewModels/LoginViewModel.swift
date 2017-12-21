//
//  LoginViewModel.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/7.
//  Copyright © 2017年 Macx. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

public protocol BaseResultModelProtocol {
    var code: Int {get set}
    var msg: String {get set}
}

struct loginModel: BaseResultModelProtocol, Codable {
    var code: Int
    var msg: String
    var data: _Data
    struct _Data: Codable {
        var password: String
        var phone: String
        var userId: String
    }
}

class LoginViewModel {
    
    /// output
    let phoneValid: Driver<Bool>
    let passwordValid: Driver<Bool>
    let commitButtonEnabled: Driver<Bool>
    let loding: Variable<Bool> = Variable(false)
    let tip: Variable<String?> = Variable(nil)
    let forgetPasswordButtonEnabled: Driver<Bool>
    let goRegisterButtonEnabled: Driver<Bool>
    
    init(phone: Driver<String>,
         password: Driver<String>) {
        
        phoneValid = phone.asDriver().map{
            validatePhonoNum(phono: $0)
        }.asDriver()
        
        passwordValid = password.asDriver().map {
            validatePassword(passWord: $0)
        }.asDriver()
        
        forgetPasswordButtonEnabled = loding.asDriver().map {
            $0 == false
        }.asDriver()
        
        goRegisterButtonEnabled = loding.asDriver().map {
            $0 == false
        }.asDriver()
        
        commitButtonEnabled = Driver.combineLatest(phoneValid, passwordValid, loding.asDriver()) { $0 && $1 && !$2 }
    }
    
    func login(phone: String, password: String) {
        loding.value = true
        MoyaProvider<LightningAPI>()
            .request(.login(phone: phone, password: password)) { [weak self] res in
                self?.loding.value = false
                switch res {
                case let .success(response):
                    let data = response.data
                    guard let model = try? JSONDecoder()
                        .decode(loginModel.self, from: data)
                        else { LogError("解析模型错误")
                        return
                    }
                    if model.code == 1000 {
                        AppSession.setUserAccount(model.data.userId, compeleted: nil)
                    }
                    else {
                        //TODO: 登录失败
                        self?.tip.value = model.msg
                    }
                    
                case let .failure(error):
                    LogError("网络请求错误，error: \(error)")
                }
        }
    }
}


