//
//  Api.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/13.
//  Copyright © 2017年 Macx. All rights reserved.
//

import Foundation
import Moya

enum LightningAPI {
    case sample
    case login(phone: String, password: String)
    case register(phone: String, password: String, validCode: String)
}

extension LightningAPI: TargetType {
    
    var base: String {
//        return "https://www.sample.com/"
        return "http://192.168.5.252:8090"
    }
    var baseURL: URL {
        return URL(string: base)!
    }
    
    var path: String {
        switch self {
        case .sample:
            return "/api/sample"
        case .login:
            return "/login/login"
        case .register:
            return "/login/userRegister"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .sample:
            return .get
        case .login:
            return .post
        case .register:
            return .post
        }
    }
    
    var sampleData: Data {
        switch self {
        case .sample, .login, .register:
            return stubbedResponse(filename: "sample")
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .sample:
            return [
                "token": "this is a token"
            ]
        case .login(let phone, let password):
            return [
                "password": password,
                "phone": phone
            ]
        case .register(let phone,let password,let validCode):
            return [
                "phone": phone,
                "password": password,
                "vCode": validCode
            ]
        }
    }
    
    var task: Task {
        let encoding: ParameterEncoding
        switch self.method {
        case .post:
            encoding = JSONEncoding.default
        default:
            encoding = URLEncoding.default
        }
        if let requestParameters = parameters {
            return .requestParameters(parameters: requestParameters, encoding: encoding)
        }
        return .requestPlain
    }
    
    
    
    var headers: [String : String]? {
        return nil
    }
    
    
    func stubbedResponse(filename: String) -> Data! {
        @objc class TestClass: NSObject { }
        let bundle = Bundle(for: TestClass.self)
        let path = bundle.path(forResource: filename, ofType: "json")
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }
    
}
