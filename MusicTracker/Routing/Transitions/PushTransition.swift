//
//  PushTransition.swift
//  MusicTracker
//
//  Created by Admin on 31.05.2018.
//  Copyright © 2018 BadCodeDeveloper. All rights reserved.
//

import UIKit

class PushTransition: NSObject {
    
    var animator: Animator?
    var isAnimated: Bool
    var completionHandler: (() -> Void)?
    
    weak var viewController: UIViewController?
    
    init(animator: Animator? = nil, isAnimated: Bool = true) {
        self.animator = animator
        self.isAnimated = isAnimated
    }
}

// MARK: - Transition
extension PushTransition: Transition {
    
    func open(_ viewController: UIViewController) {
        let navigationController = self.viewController?.navigationController
        navigationController?.delegate = self
        navigationController?.pushViewController(viewController,
                                                 animated: isAnimated)
    }
    
    func close(_ viewController: UIViewController) {
        self.viewController?.navigationController?.popViewController(animated: isAnimated)
    }
}

// MARK: - UINavigationControllerDelegate
extension PushTransition: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        completionHandler?()
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationControllerOperation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let animator = animator else { return nil }
        
        if operation == .push {
            animator.isPresenting = true
            return animator
        } else {
            animator.isPresenting = false
            return animator
        }
    }
}
