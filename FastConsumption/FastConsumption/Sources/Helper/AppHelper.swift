//
//  AppHelper.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/20.
//  Copyright © 2017年 Macx. All rights reserved.
//

import Foundation
import KeychainAccess

struct AppSession {
    static func getUserAccount() -> String? {
        let keychain = Keychain(service: "com.qhfax.www.usercount")
        let count = keychain["usercount"]
        return count;
    }
    
    static func setUserAccount(_ account: String, compeleted:(()->())?) {
        let keychain = Keychain(service: "com.qhfax.www.usercount")
        keychain["usercount"] = account
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.isLogin?.value = true
        //设置数据库
        configRealm(account)
        //有数据迁移的时候替换成下面的方法
//        configRealm(account, schemaVersion: 1) { (migration, oldSchemaVersion) in
//            if oldSchemaVersion < 1 {
//                //TODO: 这里需要做版本迁移的具体代码
//            }
//        }
        if let compeleted = compeleted { compeleted() }
    }
    
    static func removeAccount() {
        let keychain = Keychain(service: "com.qhfax.www.usercount")
        do {
            try keychain.remove("usercount")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.isLogin?.value = false
            configRealm(nil)
            //有数据迁移的时候替换成下面的方法
//            configRealm(nil, schemaVersion: 1) { (migration, oldSchemaVersion) in
//                if oldSchemaVersion < 1 {
//                    //TODO: 这里需要做版本迁移的具体代码
//                }
//            }
        } catch {
            LogError("\(error)")
        }
        
    }
}
