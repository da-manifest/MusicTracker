//
//  Transition.swift
//  MusicTracker
//
//  Created by Admin on 31.05.2018.
//  Copyright © 2018 BadCodeDeveloper. All rights reserved.
//

import Foundation
import UIKit

protocol Transition: class {
    
    var viewController: UIViewController? { get set }
    
    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}
