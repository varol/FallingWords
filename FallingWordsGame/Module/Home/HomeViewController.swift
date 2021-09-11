//
//  HomeViewController.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import UIKit

protocol HomeViewControllerInterface: AnyObject {
    func setTitle(_ title: String)
    func getTimeIntervalValue() -> Int
    func getRoundValue() -> Int
}

final class HomeViewController: BaseViewController {
    var presenter: HomePresenterInterface!
    @IBOutlet private weak var goButton: UIButton!
    @IBOutlet private weak var timeIntervalTextfield: UITextField!
    @IBOutlet private weak var roundTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    @IBAction func goButtonTapped(_ sender: Any) {
        presenter.navigateToGameScreen()
    }
}

extension HomeViewController: HomeViewControllerInterface {
        
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func getTimeIntervalValue() -> Int {
        Int(timeIntervalTextfield.text ?? "") ?? .zero
    }
    
    func getRoundValue() -> Int {
        Int(roundTextfield.text ?? "") ?? .zero
    }
}
