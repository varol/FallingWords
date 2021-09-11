//
//  HomePresenter.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import Foundation

protocol HomePresenterInterface: AnyObject {
    func viewDidLoad()
    func navigateToGameScreen()
}

extension HomePresenter {
    fileprivate enum Constants {
        static let pageTitle: String = "Falling Words"
    }
}

final class HomePresenter: HomePresenterInterface {
    
    weak var view: HomeViewControllerInterface?
    let router: HomeRouterInterface!
    let interactor: HomeInteractorInterface!

    init(interactor: HomeInteractorInterface, router: HomeRouterInterface, view: HomeViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view?.setTitle(Constants.pageTitle)
    }
    
    func navigateToGameScreen() {
        let timeInterval = view?.getTimeIntervalValue() ?? .zero
        let roundValue = view?.getRoundValue() ?? .zero
        router.navigate(.game(timeInterval: timeInterval,
                              round: roundValue))
    }
}

extension HomePresenter: HomeInteractorOutput {}
