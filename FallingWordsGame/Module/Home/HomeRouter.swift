//
//  HomeRouter.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import UIKit

protocol HomeRouterInterface: AnyObject {
    func navigate(_ route: HomeRoutes)
}

enum HomeRoutes {
    case game
}

class HomeRouter {
    weak var viewController: HomeViewController?

    static func setupModule() -> HomeViewController {
        let vc = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interactor: interactor,
        router: router,
        view: vc)
        
        vc.presenter = presenter
        interactor.output = presenter
        router.viewController = vc
        return vc
    }
}

extension HomeRouter: HomeRouterInterface {

    func navigate(_ route: HomeRoutes) {
        switch route {
        case .game:
            let vc = GameRouter.setupModule()
            viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

