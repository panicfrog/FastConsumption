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
}

extension LightningAPI: TargetType {
    
    var base: String {
        return "https://www.sample.com/"
    }
    var baseURL: URL {
        return URL(string: base)!
    }
    
    var path: String {
        switch self {
        case .sample:
            return "/api/sample"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .sample:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .sample:
            return stubbedResponse(filename: "sample")
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .sample:
            return [
                "token": "this is a token"
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
