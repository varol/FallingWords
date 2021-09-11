//
//  MockGameInteractor.swift
//  FallingWordsGameTests
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import UIKit
@testable import FallingWordsGame

final class MockGameInteractor: GameInteractorInterface {

    var invokedFetchWordData = false
    var invokedFetchWordDataCount = 0

    func fetchWordData() {
        invokedFetchWordData = true
        invokedFetchWordDataCount += 1
    }
}
