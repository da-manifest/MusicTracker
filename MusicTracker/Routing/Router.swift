//
//  Router.swift
//  MusicTracker
//
//  Created by Admin on 31.05.2018.
//  Copyright © 2018 BadCodeDeveloper. All rights reserved.
//

import UIKit

protocol Closable: class {
    
    func close()
}

protocol RouterProtocol: class {
    
    associatedtype T: UIViewController
    var viewController: T? { get }
    
    func open(_ viewController: UIViewController, transition: Transition)
}

class Router<T>: RouterProtocol, Closable where T: UIViewController {
    
    weak var viewController: T?
    var openTransition: Transition?
    
    func open(_ viewController: UIViewController, transition: Transition) {
        transition.viewController = self.viewController
        transition.open(viewController)
    }
    
    func close() {
        guard let openTransition = openTransition else {
            assertionFailure("Router: You should specify an open transition in order to close a module.")
            return
        }
        
        guard let viewController = viewController else {
            assertionFailure("Router: Nothing to close.")
            return
        }
        
        openTransition.close(viewController)
    }
}
