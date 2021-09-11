//
//  HomeInteractor.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import Foundation

protocol HomeInteractorInterface: AnyObject {}

protocol HomeInteractorOutput: AnyObject {}

final class HomeInteractor {
    var output: HomeInteractorOutput?
}

extension HomeInteractor: HomeInteractorInterface {}
