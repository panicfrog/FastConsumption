//
//  Support.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/4.
//  Copyright © 2017年 Macx. All rights reserved.
//

import Foundation
import CocoaLumberjack

/// R.Swift
let Color = R.color.self
let Font = R.font.self
let File = R.file.self
let Image = R.image.self
let Nib = R.nib.self
let ResuseIdentifier = R.reuseIdentifier.self
let Segue = R.segue.self
let Storyboard = R.storyboard.self


/// CocoaLumberjack
func LogDebug(_ message: String) {  DDLogDebug(message) }
func LogError(_ message: String) { DDLogError(message) }
func LogInfo(_ message: String) { DDLogInfo(message) }
func LogVerbose(_ message: String) { DDLogVerbose(message) }
func LogWarm(_ message: String) { DDLogWarn(message) }

func LogDebug(_ message: String ,
              level: DDLogLevel,
              context: Int,
              tag: Any?,
              asynchronous: Bool,
              ddlog: DDLog) {
    DDLogDebug(message,
               level: level,
               context: context,
               tag: tag,
               asynchronous: asynchronous,
               ddlog: ddlog)
}

func LogError(_ message: String ,
              level: DDLogLevel,
              context: Int,
              tag: Any?,
              asynchronous: Bool,
              ddlog: DDLog) {
    DDLogError(message,
               level: level,
               context: context,
               tag: tag,
               asynchronous: asynchronous,
               ddlog: ddlog)
}

func LogInfo(_ message: String ,
               level: DDLogLevel,
               context: Int,
               tag: Any?,
               asynchronous: Bool,
               ddlog: DDLog) {
    DDLogInfo(message,
               level: level,
               context: context,
               tag: tag,
               asynchronous: asynchronous,
               ddlog: ddlog)
}

func LogVerbose(_ message: String ,
               level: DDLogLevel,
               context: Int,
               tag: Any?,
               asynchronous: Bool,
               ddlog: DDLog) {
    DDLogVerbose(message,
               level: level,
               context: context,
               tag: tag,
               asynchronous: asynchronous,
               ddlog: ddlog)
}

func LogWarm(_ message: String ,
               level: DDLogLevel,
               context: Int,
               tag: Any?,
               asynchronous: Bool,
               ddlog: DDLog) {
    DDLogWarn(message,
               level: level,
               context: context,
               tag: tag,
               asynchronous: asynchronous,
               ddlog: ddlog)
}

