//
//  GamePresenterTests.swift
//  FallingWordsGameTests
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import XCTest
@testable import FallingWordsGame

class DetailsPresenterTests: XCTestCase {
    var presenter: GamePresenter!
    var view: MockGameViewController!
    var interactor: MockGameInteractor!
    var router: MockGameRouter!

    override func setUp() {
        super.setUp()
        view = .init()
        interactor = .init()
        router = .init()
        presenter = .init(interactor: interactor,
                          router: router,
                          view: view)
    }

    func test_viewDidLoad_InvokesView() {
        XCTAssertFalse(view.invokedSetTitle)
        XCTAssertNil(view.invokedSetTitleParameters)
        XCTAssertEqual(view.invokedSetTranslationLabelTextCount, 0)
        XCTAssertEqual(view.invokedSetWordLabelTextCount, 0)

        presenter.viewDidLoad()

        XCTAssertTrue(view.invokedSetTitle)
        XCTAssertNotNil(view.invokedSetTitleParameters)
        XCTAssertEqual(view.invokedSetTranslationLabelTextCount, 1)
        XCTAssertEqual(view.invokedSetWordLabelTextCount, 1)
    }

    func test_WordArrayCountWithValidData() {
        XCTAssertNil(presenter.getWordsCount())
        
        presenter.fetchWordDataOutput(result: .success(.response))
        
        XCTAssertEqual(presenter.getWordsCount(), 297)
    }
    
    func test_GetWordLabelInitialPosition() {
        XCTAssertEqual(presenter.getWordLabelInitialPosition(), 135)
    }
    
    func test_GetWordLabelFinishPosition() {
        let viewHeight = view.getViewHeight()
        let finishPosition = viewHeight - 320
        XCTAssertEqual(presenter.getWordLabelFinishPosition(), finishPosition)
    }
    
}

extension Word {
    static var response: Word {
        let path = Bundle.main.path(forResource: "words", ofType: "json")!
        let file = try! String(contentsOfFile: path)
        let data = file.data(using: .utf8)!
        let wordResponse = try! JSONDecoder().decode(Word.self, from: data)
        return wordResponse
    }

    static var emptyResponse: Word? {
        nil
    }
}
