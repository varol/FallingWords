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
    func setScoreLabelText(text: String)
    func setRoundLabelText(text: String)
    func showToastMessage(text: String)
    func getAnimationStatus() -> Bool
}

class GameViewController: UIViewController {
    @IBOutlet private weak var scoreLabel: BaseLabel!
    @IBOutlet private weak var wordLabel: BaseLabel!
    @IBOutlet private weak var translationLabel: BaseLabel!
    @IBOutlet private weak var roundLabel: BaseLabel!
    
    var presenter: GamePresenterInterface!
    var animator: UIViewPropertyAnimator?
    private var fallingWordYPossition: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    @IBAction private func rightAnswerButtonTapped() {
        view.layer.removeAllAnimations()
        presenter.chooseRightAnswer()
    }
    
    @IBAction func wrongAnswerButtonTapped(_ sender: Any) {
        view.layer.removeAllAnimations()
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
        let duration = TimeInterval(self.presenter.getGameTimeInterval())
        
        UIView.animate(withDuration: duration,
                       delay: .zero,
                       options: [.beginFromCurrentState],
                       animations: {
                        
            self.changeWordLabelPosition()
        }) { (finished) in
            if finished == true {
                self.presenter.timeFinishedAction()
            }
        }
    }
    
    func changeWordLabelPosition() {
        self.wordLabel.transform = CGAffineTransform(translationX: self.wordLabel.bounds.origin.x,
                                                     y: CGFloat(self.presenter.getWordLabelFinishPosition()))

    }
    
    func resetWordLabelPosition() {
        view.layer.removeAllAnimations()
        wordLabel.layer.removeAllAnimations()
        view.layer.layoutIfNeeded()
        UIView.animate(withDuration: .zero) {
            self.wordLabel.transform = .identity
        }
    }
    
    func setWordLabelText(text: String) {
        wordLabel.text = text
    }
    
    func setTranslationLabelText(text: String) {
        translationLabel.text = text
    }
    
    func setScoreLabelText(text: String) {
        scoreLabel.text = text
    }
    
    func setRoundLabelText(text: String) {
        roundLabel.text = text
    }
    
    func showToastMessage(text: String) {
        view.makeToast(text)
    }
    
    func getAnimationStatus() -> Bool {
        animator?.isRunning ?? false
    }
}
