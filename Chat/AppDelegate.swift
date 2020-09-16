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
        CommonElements.printState(previousState: "not running", currentState: CommonElements.convertUIApplicationState(), functionName: #function)
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        CommonElements.printState(previousState: CommonElements.convertUIApplicationState(), currentState: "inactive", functionName: #function)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        CommonElements.printState(previousState: "inactive", currentState: CommonElements.convertUIApplicationState(), functionName: #function)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        CommonElements.printState(previousState: "inactive", currentState: CommonElements.convertUIApplicationState(), functionName: #function)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        CommonElements.printState(previousState: CommonElements.convertUIApplicationState(), currentState: "inactive", functionName: #function)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        CommonElements.printState(previousState: "background", currentState: CommonElements.convertUIApplicationState(), functionName: #function)
    }
    

}

