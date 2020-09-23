//
//  ViewController.swift
//  Chat
//
//  Created by r.burdin on 13.09.2020.
//  Copyright © 2020 r.burdin. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        StateLogger.printState(previousState: "not running", currentState: StateLogger.convertUIApplicationState(), functionName: #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        StateLogger.printState(previousState: "inactive", currentState: StateLogger.convertUIApplicationState(), functionName: #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        StateLogger.printState(previousState: "inactive", currentState: StateLogger.convertUIApplicationState(), functionName: #function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        StateLogger.printState(previousState: StateLogger.convertUIApplicationState(), currentState: "inactive", functionName: #function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        StateLogger.printState(previousState: "inactive", currentState: StateLogger.convertUIApplicationState(), functionName: #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        StateLogger.printState(previousState: "active", currentState: StateLogger.convertUIApplicationState(), functionName: #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        StateLogger.printState(previousState: "inactive", currentState: StateLogger.convertUIApplicationState(), functionName: #function)
    }
 
}

