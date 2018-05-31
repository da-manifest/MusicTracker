//
//  HomeModuleBuilder.swift
//  MusicTracker
//
//  Created by Admin on 31.05.2018.
//  Copyright © 2018 BadCodeDeveloper. All rights reserved.
//

final class HomeModuleBuilder {
    
    static func make() -> HomeViewController {
        let router = HomeRouter()
        let viewModel = HomeViewModel(router: router)
        let viewController = HomeViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}
