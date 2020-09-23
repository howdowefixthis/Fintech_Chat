//
//  File.swift
//  Chat
//
//  Created by r.burdin on 15.09.2020.
//  Copyright © 2020 r.burdin. All rights reserved.
//

import UIKit

class StateLogger {

    static func printState(previousState: String, currentState: String, functionName: String) {
        #if APPSTATE
        print("Application moved from \(previousState) to \(currentState): \(functionName)")
        #endif
    }
    
    static func convertUIApplicationState() -> String {
        switch UIApplication.shared.applicationState {
        case .active:
            return "active"
        case .inactive:
            return "inactive"
        case .background:
            return "background"
        default:
            return "not running"
        }
    }
}
