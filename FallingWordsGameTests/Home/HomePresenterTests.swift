//
//  HomePresenterTests.swift
//  FallingWordsGameTests
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import XCTest
@testable import FallingWordsGame

class HomePresenterTests: XCTestCase {
    var presenter: HomePresenter!
    var view: MockHomeViewController!
    var interactor: MockHomeInteractor!
    var router: MockHomeRouter!
    
    override func setUp() {
        super.setUp()
        view = .init()
        interactor = .init()
        router = .init()
        presenter = .init(interactor: interactor, router: router, view: view)
    }

    func test_viewDidLoad_InvokesRequiredViewMethods() {
        XCTAssertFalse(view.invokedSetTitle)
        XCTAssertNil(view.invokedSetTitleParameters)

        presenter.viewDidLoad()
        
        XCTAssertTrue(view.invokedSetTitle)
        XCTAssertEqual(view.invokedSetTitleParameters?.title, "Falling Words")
    }
}
