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
    func checkAnswer(myAnswer: Bool)
    func timeFinishedAction()
    func pickRightWord()
    func pickRandomWord()
    func moveNextWord()
    func resetWordLabelPosition()
}

extension GamePresenter {
    fileprivate enum Constants {
        static let bottomPosition: Int = 320
        static let gameTimeInterval: Int = 5
        static let roundInitialValue: Int = 1
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
    private var round: Int = Constants.roundInitialValue
    private var isGameFinished: Bool = false
    private var wordText: String = ""
    private var translationText: String = ""
    private var currentIndex: Int = 0 {
        didSet {
            currentIndex = Int.random(in: 0..<words.count)
        }
    }
    
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
        moveNextWord()
        view?.setScoreLabelText(text: "Score: \(score)")
        view?.setRoundLabelText(text: "Round: \(round)")
    }
        
    func fallWordLabel() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.view?.fallWordLabel()
        }
    }
    
    func chooseRightAnswer() {
        checkAnswer(myAnswer: true)
    }
    
    func chooseWrongAnswer() {
        checkAnswer(myAnswer: false)
    }
    
    func checkAnswer(myAnswer: Bool) {
        if round <= 10 && isGameFinished == false {
            let answer = words[currentIndex].textEng == wordText
            if myAnswer == answer {
                view?.showToastMessage(text: "Right 👍")
                score += 1
                view?.setScoreLabelText(text: "Score: \(score)")
            } else {
                view?.showToastMessage(text: "Wrong 👎")
            }
            
            if round < 10 {
                round += 1
                view?.setRoundLabelText(text: "Round: \(round)")
                moveNextWord()
            } else {
                isGameFinished = true
                view?.showToastMessage(text: "Finished 🏁")
            }
        } else {
            view?.showToastMessage(text: "Finished 🏁")
        }
    }
    
    func resetWordLabelPosition() {
        self.view?.resetWordLabelPosition()
    }
    
    func timeFinishedAction() {
        if round < 10 {
            round += 1
            view?.setRoundLabelText(text: "Round: \(round)")
            moveNextWord()
        }
    }
    
    func pickRightWord() {
        let word = words[currentIndex]
        wordText = word.textEng
        translationText = word.textSPA
    }
    
    func pickRandomWord() {
        let word = words[currentIndex]
        let randomWordIndex = Int.random(in: 0..<words.count)
        let randomWord = words[randomWordIndex]
        wordText = randomWord.textEng
        translationText = word.textSPA
    }

    func moveNextWord() {
        currentIndex = Int.random(in: 0..<words.count)
        
        let number = Int.random(in: 0...9)
        if number % 2 == 0 {
            pickRightWord()
        } else {
            pickRandomWord()
        }
        
        view?.setWordLabelText(text: wordText)
        view?.setTranslationLabelText(text: translationText)
        resetWordLabelPosition()
        
        fallWordLabel()
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
