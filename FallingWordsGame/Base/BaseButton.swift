//
//  BaseButton.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import UIKit

class BaseButton: UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureButton()
        configureFont()
    }
    
    func configureButton() {
        self.layer.cornerRadius = 6
    }
    
    func configureFont() {}
}
