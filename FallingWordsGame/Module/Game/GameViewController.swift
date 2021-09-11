//
//  GameViewController.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import UIKit

protocol GameViewControllerInterface: class {
    func setTitle(_ title: String)
    func fallWordLabel()
    func resetWordLabelPosition()
    func getViewHeight() -> Int
    func setWordLabelText(text: String)
    func setTranslationLabelText(text: String)
    func setTimeLabelText(text: String)
    func setScoreLabelText(text: String)
}

class GameViewController: UIViewController {
    @IBOutlet private weak var timeLabel: BaseLabel!
    @IBOutlet private weak var scoreLabel: BaseLabel!
    @IBOutlet private weak var wordLabel: BaseLabel!
    @IBOutlet private weak var translationLabel: BaseLabel!
    
    var presenter: GamePresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    @IBAction private func rightAnswerButtonTapped() {
        presenter.chooseRightAnswer()
    }
    
    @IBAction func wrongAnswerButtonTapped(_ sender: Any) {
        presenter.chooseWrongAnswer()
    }
    
}

extension GameViewController: GameViewControllerInterface {
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func getViewHeight() -> Int {
        Int(view.frame.size.height)
    }
    
    func fallWordLabel() {
        let duration = TimeInterval(presenter.getGameTimeInterval())
        UIView.animate(withDuration: duration, animations: {
            self.changeWordLabelPosition()
        }, completion: { (finished: Bool) in
            if finished {
                self.presenter.timeFinishedAction()
            }
        })
    }
    
    func changeWordLabelPosition() {
        wordLabel?.center.y = CGFloat(presenter.getWordLabelFinishPosition())
    }
    
    func resetWordLabelPosition() {
        wordLabel.center.y = CGFloat(presenter.getWordLabelInitialPosition())
    }

    func setWordLabelText(text: String) {
        wordLabel.text = text
    }
    
    func setTranslationLabelText(text: String) {
        translationLabel.text = text
    }
    
    func setTimeLabelText(text: String) {
        timeLabel.text = text
    }
    
    func setScoreLabelText(text: String) {
        scoreLabel.text = text
    }
}
