//
//  MockHomeViewController.swift
//  FallingWordsGameTests
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

@testable import FallingWordsGame
import UIKit

final class MockHomeViewController: HomeViewControllerInterface {

    var invokedSetTitle = false
    var invokedSetTitleCount = 0
    var invokedSetTitleParameters: (title: String, Void)?
    var invokedSetTitleParametersList = [(title: String, Void)]()

    func setTitle(_ title: String) {
        invokedSetTitle = true
        invokedSetTitleCount += 1
        invokedSetTitleParameters = (title, ())
        invokedSetTitleParametersList.append((title, ()))
    }

    var invokedGetTimeIntervalValue = false
    var invokedGetTimeIntervalValueCount = 0
    var stubbedGetTimeIntervalValueResult: Int! = 0

    func getTimeIntervalValue() -> Int {
        invokedGetTimeIntervalValue = true
        invokedGetTimeIntervalValueCount += 1
        return stubbedGetTimeIntervalValueResult
    }

    var invokedGetRoundValue = false
    var invokedGetRoundValueCount = 0
    var stubbedGetRoundValueResult: Int! = 0

    func getRoundValue() -> Int {
        invokedGetRoundValue = true
        invokedGetRoundValueCount += 1
        return stubbedGetRoundValueResult
    }
}
