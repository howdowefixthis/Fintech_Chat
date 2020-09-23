//
//  AppDelegate.swift
//  Chat
//
//  Created by r.burdin on 13.09.2020.
//  Copyright © 2020 r.burdin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        StateLogger.printState(previousState: "not running", currentState: StateLogger.convertUIApplicationState(), functionName: #function)
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        StateLogger.printState(previousState: StateLogger.convertUIApplicationState(), currentState: "inactive", functionName: #function)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        StateLogger.printState(previousState: "inactive", currentState: StateLogger.convertUIApplicationState(), functionName: #function)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        StateLogger.printState(previousState: "inactive", currentState: StateLogger.convertUIApplicationState(), functionName: #function)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        StateLogger.printState(previousState: StateLogger.convertUIApplicationState(), currentState: "inactive", functionName: #function)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        StateLogger.printState(previousState: "background", currentState: StateLogger.convertUIApplicationState(), functionName: #function)
    }
    

}

