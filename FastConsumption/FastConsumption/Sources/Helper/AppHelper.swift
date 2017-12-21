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
    
    static func setUserAccount(_ count: String, compeleted:(()->())?) {
        let keychain = Keychain(service: "com.qhfax.www.usercount")
        keychain["usercount"] = count
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.isLogin?.value = true
        if let compeleted = compeleted { compeleted() }
    }
    
    static func removeAccount() {
        let keychain = Keychain(service: "com.qhfax.www.usercount")
        do {
            try keychain.remove("usercount")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.isLogin?.value = false
        } catch {
            LogError("\(error)")
        }
        
    }
}
