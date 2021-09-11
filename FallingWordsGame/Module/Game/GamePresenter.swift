//
//  GamePresenter.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import Foundation

protocol GamePresenterInterface: class {

}

final class GamePresenter: GamePresenterInterface {

    unowned var view: GameViewControllerInterface!
    let router: GameRouterInterface!
    let interactor: GameInteractorInterface!

    init(interactor: GameInteractorInterface,  router: GameRouterInterface, view:  GameViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension GamePresenter: GameInteractorOutputInterface {

}
