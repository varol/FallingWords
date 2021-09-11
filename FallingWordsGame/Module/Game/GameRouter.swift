//
//  GameRouter.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import UIKit

protocol GameRouterInterface: class {
    func navigate(_ route: GameRoutes)
}

enum GameRoutes {
    
}

class GameRouter: NSObject {

    weak var presenter: GamePresenterInterface?
    weak var viewController: GameViewController?
    
    static func setupModule() -> GameViewController {
        let vc = GameViewController()
        let interactor = GameInteractor()
        let router = GameRouter()
        let presenter = GamePresenter(interactor: interactor,
        router: router,
        view: vc)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.output = presenter
        router.viewController = vc
        return vc
    }
}

extension GameRouter: GameRouterInterface {
    func navigate(_ route: GameRoutes) {
        
    }
}

