//
//  GCD.swift
//  ArriveWithin3s
//
//  Created by Macx on 2017/11/24.
//  Copyright © 2017年 Macx. All rights reserved.
//

import Foundation

typealias Task = (_ cancel : Bool) -> Void

///延迟执行任务
@discardableResult
func delay(_ time: TimeInterval, task: @escaping ()->()) ->  Task? {
    
    func dispatch_later(block: @escaping ()->()) {
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    var closure: (()->Void)? = task
    var result: Task?
    
    let delayedClosure: Task = {
        cancel in
        if let internalClosure = closure {
            if (cancel == false) {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    return result
}

///取消延迟执行的任务
func cancel(_ task: Task?) {
    task?(true)
}
