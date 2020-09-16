//
//  ViewController.swift
//  Chat
//
//  Created by r.burdin on 13.09.2020.
//  Copyright © 2020 r.burdin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        CommonElements.printState(previousState: "not running", currentState: CommonElements.convertUIApplicationState(), functionName: #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        CommonElements.printState(previousState: "inactive", currentState: CommonElements.convertUIApplicationState(), functionName: #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        CommonElements.printState(previousState: "inactive", currentState: CommonElements.convertUIApplicationState(), functionName: #function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        CommonElements.printState(previousState: CommonElements.convertUIApplicationState(), currentState: "inactive", functionName: #function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        CommonElements.printState(previousState: "inactive", currentState: CommonElements.convertUIApplicationState(), functionName: #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        CommonElements.printState(previousState: "active", currentState: CommonElements.convertUIApplicationState(), functionName: #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        CommonElements.printState(previousState: "inactive", currentState: CommonElements.convertUIApplicationState(), functionName: #function)
    }
 

}

