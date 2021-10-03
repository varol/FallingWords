//
//  GamePresenter.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import Foundation

protocol GamePresenterInterface: AnyObject {
    func viewDidLoad()
    func getWordLabelInitialPosition() -> Int
    func getWordLabelFinishPosition() -> Int
    func loadInitialData()
    func startFallingWordLabel()
    func chooseRightAnswer()
    func chooseWrongAnswer()
    func checkAnswer(myAnswer: Bool)
    func timeFinishedAction()
    func pickRightWord()
    func pickRandomWord()
    func moveNextWord()
    func resetWordLabelPosition()
    func getWordsCount() -> Int?
}

extension GamePresenter {
    fileprivate enum Constants {
        static let bottomPosition: Int = 320
        static let roundInitialValue: Int = 1
        static let wordLabelInitialPosition: Int = 135
        static let scoreInitialValue: Int = .zero
        static let pageTitle: String = "Falling Words"
        static let scoreText: String = "Score:"
        static let roundText: String = "Round:"
        static let rightAnswerText: String = "Right 👍"
        static let wrongAnswerText: String = "Wrong 👎"
        static let finishedGameText: String = "Finished 🏁"
    }
}

final class GamePresenter: GamePresenterInterface {
    weak var view: GameViewControllerInterface?
    let router: GameRouterInterface!
    let interactor: GameInteractorInterface!
    private var words: [WordElement]?
    private var score: Int = Constants.scoreInitialValue
    private var round: Int = Constants.roundInitialValue
    private var isGameFinished: Bool = false
    private var wordText: String = ""
    private var translationText: String = ""
    private var roundLimit: Int = 0
    private var currentIndex: Int = 0 {
        didSet {
            if let wordsCount = getWordsCount() {
                currentIndex = Int.random(in: 0..<wordsCount)
            }
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
        
    fileprivate func setScoreLabel() {
        view?.setScoreLabelText(text: "\(Constants.scoreText) \(score)")
    }
    
    fileprivate func setRoundLabel() {
        view?.setRoundLabelText(text: "\(Constants.roundText) \(round)")
    }
    
    func loadInitialData() {
        roundLimit = view?.getRoundValue() ?? .zero
        moveNextWord()
        setScoreLabel()
        setRoundLabel()
    }
        
    func startFallingWordLabel() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.view?.startFallingWordLabel()
        }
    }
    
    func chooseRightAnswer() {
        checkAnswer(myAnswer: true)
    }
    
    func chooseWrongAnswer() {
        checkAnswer(myAnswer: false)
    }
    
    func checkAnswer(myAnswer: Bool) {
        if round <= roundLimit && isGameFinished == false {
            let answer = words?[currentIndex].textEng == wordText
            if myAnswer == answer {
                view?.showToastMessage(text: Constants.rightAnswerText)
                score += 1
                setScoreLabel()
            } else {
                view?.showToastMessage(text: Constants.wrongAnswerText)
            }
            
            if round < roundLimit {
                round += 1
                setRoundLabel()
                moveNextWord()
            } else {
                isGameFinished = true
                view?.showToastMessage(text: Constants.finishedGameText)
            }
        } else {
            view?.showToastMessage(text: Constants.finishedGameText)
        }
    }
    
    func resetWordLabelPosition() {
        self.view?.resetWordLabelPosition()
    }
    
    func timeFinishedAction() {
        if round < roundLimit {
            round += 1
            setRoundLabel()
            moveNextWord()
        }
    }
    
    func pickRightWord() {
        if let word = words?[safe: currentIndex] {
            wordText = word.textEng
            translationText = word.textSPA
        }
    }
    
    func pickRandomWord() {
        if let word = words?[safe: currentIndex] {
            translationText = word.textSPA
        }
        
        if let wordsCount = getWordsCount() {
            let randomWordIndex = Int.random(in: 0..<wordsCount)
            if let randomWord = words?[safe: randomWordIndex] {
                wordText = randomWord.textEng
            }
        }
    }

    func moveNextWord() {
        if let wordsCount = getWordsCount() {
            currentIndex = Int.random(in: 0..<wordsCount)
        }
        
        let number = Int.random(in: 0...9)
        if number % 2 == 0 {
            pickRightWord()
        } else {
            pickRandomWord()
        }
        
        view?.setWordLabelText(text: wordText)
        view?.setTranslationLabelText(text: translationText)
        resetWordLabelPosition()
        
        startFallingWordLabel()
    }
    
    func getWordsCount() -> Int? {
        words?.count
    }
    
}

extension GamePresenter: GameInteractorOutput {
    func fetchWordDataOutput(result: WordResult) {
        switch result {
        case .success(let wordsResult):
            words = wordsResult
        case .failure(let error):
            view?.showToastMessage(text: error.localizedDescription)
        }
    }
}
