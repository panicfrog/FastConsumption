//
//  AppDelegate.swift
//  FastConsumption
//
//  Created by Macx on 2017/12/4.
//  Copyright © 2017年 Macx. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import CocoaLumberjack
import KeychainAccess
import RxSwift

#if DEBUG
    import FLEX
#endif


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    public var isLogin: Variable<Bool>?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        /// 配置调试工具
        configFlex()
        /// 配置日志系统
        configLogger()
        /// 配置全局键盘
        configIqKeyboardSupport()
        
        /// 判断是否登录
        pointOutRootViewController()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    ///MARK: - Helper foundation
    /// DEBUG
    func configFlex() {
        #if DEBUG
            FLEXManager.shared().showExplorer()
            FLEXManager.shared().isNetworkDebuggingEnabled = true
        #endif
    }
    
    /// Keyboard
    func configIqKeyboardSupport() {
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().shouldResignOnTouchOutside = true
    }
    
    /// Logger
    func configLogger() {
        DDLog.add(DDTTYLogger.sharedInstance) //Xcode console
//        DDLog.add(DDASLLogger.sharedInstance) //Apple System Logs
        
        let fileLogger: DDFileLogger = DDFileLogger()
        fileLogger.rollingFrequency = TimeInterval(60*60*24)
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        DDLog.add(fileLogger)
    }
    
    // Root ViewController
    func pointOutRootViewController(){
        let count = AppSession.getUserAccount()
        window = UIWindow(frame: UIScreen.main.bounds)
        if count == nil {
            isLogin = Variable(false)
        }
        else {
            isLogin = Variable(true)
        }
        if let isLogin = isLogin {
           _ = isLogin.asDriver().drive(onNext: {[unowned self] login in
                if !login {
                    self.window?.rootViewController = Storyboard.loginingStoryboard().instantiateInitialViewController()
                    self.window?.makeKeyAndVisible()
                }
                else {
                    self.window?.rootViewController = DrawerViewController(side: SideViewController(), bottom: Variable(nil))
                    self.window?.makeKeyAndVisible()
                }
            })
        }
    }
    
}

