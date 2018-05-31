//
//  Animator.swift
//  MusicTracker
//
//  Created by Admin on 31.05.2018.
//  Copyright © 2018 BadCodeDeveloper. All rights reserved.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool { get set }
}
