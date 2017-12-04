//
//  RipptonUIExtensions.swift
//  Rippton
//
//  Created by yeyongping on 2017/8/25.
//  Copyright © 2017年 Rippton. All rights reserved.
//

import UIKit

public var IsPad: Bool { return UIDevice.isPad() }
public var IsIphone: Bool { return UIDevice.isIphone() }
public var IsSimulator: Bool { return UIDevice.isSimulator() }

public var DiskSpace: Int64? { return UIDevice.diskSpace() }
public var DiskFreeSpace: Int64? { return UIDevice.diskFreeSpace() }
public var DiskUsedSpace: Int64? { return UIDevice.diskUsedSpace() }

public var MemoryTotal: UInt64 { return UIDevice.memoryTotal() }
public var MemoryUsed: UInt64? { return UIDevice.memoryUsed() }

public var ScreenHeight: CGFloat { return UIScreen.main.bounds.height }
public var ScreenWidth: CGFloat { return UIScreen.main.bounds.width }
public var ScreenScale: CGFloat { return UIScreen.main.scale }

public var IOS8OrLater: Bool {
    if let foo = UIDevice.iOS8Later() { return foo }
    else { return false }
}
public var IOS9OrLater: Bool {
    if let foo = UIDevice.iOS9Later() { return foo }
    else { return false }
}
public var IOS10OrLater: Bool {
    if let foo = UIDevice.iOS10Later() { return foo }
    else { return false }
}
public var IOS11OrLater: Bool {
    if let foo = UIDevice.iOS11Later() { return foo }
    else { return false }
}

extension UIDevice {
    /// 是否是iPad
   class func isPad() -> Bool {
        guard case UI_USER_INTERFACE_IDIOM() = UIUserInterfaceIdiom.pad else {
            return false
        }
        return true
    }
    
    /// 是否是iPhone
    class func isIphone() -> Bool {
        guard case UI_USER_INTERFACE_IDIOM() = UIUserInterfaceIdiom.phone else {
            return false
        }
        return true
    }
    
    /// 是否是模拟器
    class func isSimulator() -> Bool {
        guard let _ = UIDevice.current.model.range(of: "Simulator") else {
            return false
        }
        return true
    }
    
    /// 磁盘总空间
    class func diskSpace() -> Int64? {
        guard
            let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()),
            let diskSize = systemAttributes[.systemSize] as? NSNumber
            else {
                return nil
        }
        return diskSize.int64Value
    }
    
    /// 磁盘剩余空间
    class func diskFreeSpace() -> Int64? {
        guard
            let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()),
            let freeSpace = systemAttributes[.systemFreeSize] as? NSNumber
            else {
                return nil
        }
        return freeSpace.int64Value
    }
    
    /// 磁盘使用空间
    class func diskUsedSpace() -> Int64? {
        guard
            let total = self.diskSpace(),
            let free = self.diskFreeSpace()
            else {
                return nil
        }
        return total - free
    }
    
    /// 总内存
    class func memoryTotal() -> UInt64 {
        return ProcessInfo.processInfo.physicalMemory
    }
    
    /// 使用的内存
    class func memoryUsed() -> UInt64? {
        var taskInfo = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4
        let kerr: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
            }
        }
        
        if kerr == KERN_SUCCESS { return taskInfo.resident_size }
        else { return nil }
    }
    
    /// 大于等于iOS8
    class func iOS8Later() -> Bool? {
        guard
            let versionString = UIDevice.current.systemVersion.components(separatedBy: ".").first,
            let version = Float(versionString) else {
                return nil
        }
        return version >= 8.0
    }
    
    /// 大于等于iOS9
    class func iOS9Later() -> Bool? {
        guard
            let versionString = UIDevice.current.systemVersion.components(separatedBy: ".").first,
            let version = Float(versionString) else {
                return nil
        }
        return version >= 9.0
    }
    
    /// 大于等于iOS10
    class func iOS10Later() -> Bool? {
        guard
            let versionString = UIDevice.current.systemVersion.components(separatedBy: ".").first,
            let version = Float(versionString) else {
                return nil
        }
        return version >= 10.0
    }
    
    /// 大于等于iOS11
    class func iOS11Later() -> Bool? {
        guard
            let versionString = UIDevice.current.systemVersion.components(separatedBy: ".").first,
            let version = Float(versionString) else {
                return nil
        }
        return version >= 11.0
    }
}

extension UINavigationController {
    
    /// push添加completion操作
    func pushViewController(_ viewController: UIViewController,
                            animated: Bool, completion: @escaping () -> Void) {
        
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    /// pop添加completion操作
    func popViewController(_ animated: Bool, completion: @escaping () -> Void) {
        
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: animated)
        CATransaction.commit()
    }
}

extension CGRect {
    func cutApart(proportion: CGFloat, from:CGRectEdge) -> (CGRect, CGRect) {
        
        var distance:CGFloat = 0.0
        var edge = CGRectEdge.minXEdge
        
        if proportion >= 0 && proportion <= 1 {
            edge = from
            if from == .maxXEdge || from == .minXEdge {  distance = self.width * proportion }
            else { distance = self.height * proportion }
        }
        
        return self.divided(atDistance:distance, from: edge)
    }
}
