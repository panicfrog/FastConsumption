//
//  RealmManager.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/21.
//  Copyright © 2017年 Macx. All rights reserved.
//

import Foundation
import Realm

/// 设置数据库关联账户， 并且设置数据库的迁移策略
func configRealm(_ unionId: String?, schemaVersion: UInt64 = 0, migrationBlock: ((RLMMigration, UInt64)->())? = nil){
    let config = RLMRealmConfiguration.default()
    guard let unionId = unionId else {
        RLMRealmConfiguration.setDefault(config)
        return
    }
    config.fileURL = config.fileURL?
        .deletingPathExtension()
        .deletingLastPathComponent()
        .appendingPathComponent(unionId)
        .appendingPathExtension("realm")
    config.schemaVersion = schemaVersion
    config.migrationBlock = migrationBlock
    RLMRealmConfiguration.setDefault(config)
}
