//
//  MockHomeRouter.swift
//  FallingWordsGameTests
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import Foundation
@testable import FallingWordsGame

final class MockHomeRouter: HomeRouterInterface {

    var invokedNavigate = false
    var invokedNavigateCount = 0
    var invokedNavigateParameters: (route: HomeRoutes, Void)?
    var invokedNavigateParametersList = [(route: HomeRoutes, Void)]()

    func navigate(_ route: HomeRoutes) {
        invokedNavigate = true
        invokedNavigateCount += 1
        invokedNavigateParameters = (route, ())
        invokedNavigateParametersList.append((route, ()))
    }
}
