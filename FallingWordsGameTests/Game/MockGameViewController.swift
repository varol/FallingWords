//
//  MockGameViewController.swift
//  FallingWordsGameTests
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

@testable import FallingWordsGame
import UIKit

final class MockGameViewController: GameViewControllerInterface {

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

    var invokedStartFallingWordLabel = false
    var invokedStartFallingWordLabelCount = 0

    func startFallingWordLabel() {
        invokedStartFallingWordLabel = true
        invokedStartFallingWordLabelCount += 1
    }

    var invokedResetWordLabelPosition = false
    var invokedResetWordLabelPositionCount = 0

    func resetWordLabelPosition() {
        invokedResetWordLabelPosition = true
        invokedResetWordLabelPositionCount += 1
    }

    var invokedGetViewHeight = false
    var invokedGetViewHeightCount = 0
    var stubbedGetViewHeightResult: Int! = 0

    func getViewHeight() -> Int {
        invokedGetViewHeight = true
        invokedGetViewHeightCount += 1
        return stubbedGetViewHeightResult
    }

    var invokedSetWordLabelText = false
    var invokedSetWordLabelTextCount = 0
    var invokedSetWordLabelTextParameters: (text: String, Void)?
    var invokedSetWordLabelTextParametersList = [(text: String, Void)]()

    func setWordLabelText(text: String) {
        invokedSetWordLabelText = true
        invokedSetWordLabelTextCount += 1
        invokedSetWordLabelTextParameters = (text, ())
        invokedSetWordLabelTextParametersList.append((text, ()))
    }

    var invokedSetTranslationLabelText = false
    var invokedSetTranslationLabelTextCount = 0
    var invokedSetTranslationLabelTextParameters: (text: String, Void)?
    var invokedSetTranslationLabelTextParametersList = [(text: String, Void)]()

    func setTranslationLabelText(text: String) {
        invokedSetTranslationLabelText = true
        invokedSetTranslationLabelTextCount += 1
        invokedSetTranslationLabelTextParameters = (text, ())
        invokedSetTranslationLabelTextParametersList.append((text, ()))
    }

    var invokedSetScoreLabelText = false
    var invokedSetScoreLabelTextCount = 0
    var invokedSetScoreLabelTextParameters: (text: String, Void)?
    var invokedSetScoreLabelTextParametersList = [(text: String, Void)]()

    func setScoreLabelText(text: String) {
        invokedSetScoreLabelText = true
        invokedSetScoreLabelTextCount += 1
        invokedSetScoreLabelTextParameters = (text, ())
        invokedSetScoreLabelTextParametersList.append((text, ()))
    }

    var invokedSetRoundLabelText = false
    var invokedSetRoundLabelTextCount = 0
    var invokedSetRoundLabelTextParameters: (text: String, Void)?
    var invokedSetRoundLabelTextParametersList = [(text: String, Void)]()

    func setRoundLabelText(text: String) {
        invokedSetRoundLabelText = true
        invokedSetRoundLabelTextCount += 1
        invokedSetRoundLabelTextParameters = (text, ())
        invokedSetRoundLabelTextParametersList.append((text, ()))
    }

    var invokedShowToastMessage = false
    var invokedShowToastMessageCount = 0
    var invokedShowToastMessageParameters: (text: String, Void)?
    var invokedShowToastMessageParametersList = [(text: String, Void)]()

    func showToastMessage(text: String) {
        invokedShowToastMessage = true
        invokedShowToastMessageCount += 1
        invokedShowToastMessageParameters = (text, ())
        invokedShowToastMessageParametersList.append((text, ()))
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
