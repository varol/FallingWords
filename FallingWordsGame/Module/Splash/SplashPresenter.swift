//
//  SplashPresenter.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import Foundation

protocol SplashPresenterInterface: AnyObject {
    func viewDidAppear()
    func navigateToHomeScreen()

}

final class SplashPresenter: SplashPresenterInterface {
    
    weak var view: SplashViewControllerInterface?
    let router: SplashRouterInterface!
    let interactor: SplashInteractorInterface!

    init(interactor: SplashInteractorInterface,  router: SplashRouterInterface, view:  SplashViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidAppear() {
        navigateToHomeScreen()
    }
    
    func navigateToHomeScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.router.navigate(.homeScreen)
        }
    }
}

extension SplashPresenter: SplashInteractorOutput {}
