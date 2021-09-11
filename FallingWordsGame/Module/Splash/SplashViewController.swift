//
//  SplashViewController.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import UIKit

protocol SplashViewControllerInterface: AnyObject {
}

final class SplashViewController: BaseViewController {
    var presenter: SplashPresenterInterface!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
}

extension SplashViewController: SplashViewControllerInterface {}
