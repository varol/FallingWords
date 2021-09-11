//
//  GamePresenter.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import Foundation

protocol GamePresenterInterface: class {
    func viewDidLoad()
    func getWordLabelInitialPosition() -> Int
    func getWordLabelFinishPosition() -> Int
    func getGameTimeInterval() -> Int
    func setWordLabelText()
    func setTranslationText()
    func loadInitialData()
    func fallWordLabel()
    func chooseRightAnswer()
    func chooseWrongAnswer()
    func isAnswerRight(answer: String) -> Bool
    func timeFinishedAction()
}

extension GamePresenter {
    fileprivate enum Constants {
        static let bottomPosition: Int = 180
        static let gameTimeInterval: Int = 5
        static let wordLabelInitialPosition: Int = 135
        static let scoreInitialValue: Int = .zero
        static let pageTitle: String = "Falling Words"
    }
}

final class GamePresenter: GamePresenterInterface {
    weak var view: GameViewControllerInterface?
    let router: GameRouterInterface!
    let interactor: GameInteractorInterface!
    private var words: [WordElement] = []
    private var score: Int = Constants.scoreInitialValue
    private var time: Int = Constants.gameTimeInterval

    init(interactor: GameInteractorInterface,
         router: GameRouterInterface,
         view: GameViewControllerInterface) {
        
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view?.setTitle(Constants.pageTitle)
        interactor.fetchWordData()
        loadInitialData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.fallWordLabel()
        }
    }

    func getWordLabelInitialPosition() -> Int {
        Constants.wordLabelInitialPosition
    }
    
    func getWordLabelFinishPosition() -> Int {
        guard let viewHeight = view?.getViewHeight() else { return .zero}
        return viewHeight - Constants.bottomPosition
    }
    
    func getGameTimeInterval() -> Int {
        Constants.gameTimeInterval
    }
    
    func setWordLabelText() {
        let wordText = words[2]
        view?.setWordLabelText(text: wordText.textEng)
    }
    
    func setTranslationText() {
        let translationText = words[2]
        view?.setTranslationLabelText(text: translationText.textSPA)
    }
    
    func loadInitialData() {
        let word = words.randomElement()
        view?.setWordLabelText(text: word?.textEng ?? "")
        view?.setTranslationLabelText(text: word?.textSPA ?? "")
        view?.setTimeLabelText(text: "Time: \(time)")
        view?.setScoreLabelText(text: "Score: \(score)")
    }
    
    func fallWordLabel() {
        view?.fallWordLabel()
    }
    
    func chooseRightAnswer() {
        print("right")
    }
    
    func chooseWrongAnswer() {
        print("wrong")
    }
    
    func isAnswerRight(answer: String) -> Bool {
        return true
    }
    
    func timeFinishedAction() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.view?.resetWordLabelPosition()
        }
    }
}

extension GamePresenter: GameInteractorOutput {
    func fetchWordDataOutput(result: WordResult) {
        switch result {
        case .success(let wordsResult):
            words.append(contentsOf: wordsResult)
        case .failure(let error):
            print(error)
        }
    }
}
