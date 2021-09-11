//
//  GameInteractor.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import Foundation

protocol GameInteractorInterface: class {

}

protocol GameInteractorOutputInterface: class {

}

final class GameInteractor {
    var output: GameInteractorOutputInterface?
}

extension GameInteractor: GameInteractorInterface {

}
