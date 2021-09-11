//
//  SplashRouter.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import UIKit

protocol SplashRouterInterface: AnyObject {
    func navigate(_ route: SplashRoutes)
}

enum SplashRoutes {
    case homeScreen
}

class SplashRouter: NSObject {
    weak var viewController: SplashViewController?

    static func setupModule() -> SplashViewController {
        let vc = SplashViewController()
        let interactor = SplashInteractor()
        let router = SplashRouter()
        let presenter = SplashPresenter(interactor: interactor,
        router: router,
        view: vc)
        vc.presenter = presenter
        interactor.output = presenter
        router.viewController = vc
        return vc
    }
}

extension SplashRouter: SplashRouterInterface {
    func navigate(_ route: SplashRoutes) {
        switch route {
        case .homeScreen:
            guard let window = viewController?.view.window else { return }
            let viewController = HomeRouter.setupModule()
            let navigationController = UINavigationController(rootViewController: viewController)
            window.rootViewController = navigationController
        }
    }
}
