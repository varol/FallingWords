//
//  GameViewController.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import UIKit

protocol GameViewControllerInterface: class {

}

class GameViewController: UIViewController {
    var presenter: GamePresenterInterface!
}

extension GameViewController: GameViewControllerInterface {

}
