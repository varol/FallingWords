//
//  HomeViewController.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import UIKit

protocol HomeViewControllerInterface: AnyObject {
    func showLoadingView()
    func hideLoadingView()
    func setTitle(_ title: String)
}

final class HomeViewController: BaseViewController, LoadingShowable {
    var presenter: HomePresenterInterface!
    @IBOutlet private weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    @IBAction func goButtonTapped(_ sender: Any) {
        presenter.navigateToGameScreen()
    }
}

extension HomeViewController: HomeViewControllerInterface {
    
    func showLoadingView() {
        showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
    
    func setTitle(_ title: String) {
        self.title = title
    }
}
