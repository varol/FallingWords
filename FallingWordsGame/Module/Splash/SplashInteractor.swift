//
//  SplashInteractor.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import Foundation

protocol SplashInteractorInterface: AnyObject {
}

protocol SplashInteractorOutput: AnyObject {
}

final class SplashInteractor {
    var output: SplashInteractorOutput?
}

extension SplashInteractor: SplashInteractorInterface {}
