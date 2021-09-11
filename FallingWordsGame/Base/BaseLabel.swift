//
//  BaseLabel.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import UIKit

class BaseLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureLabel()
        configureFont()
    }
    
    func configureLabel() {
    }
    
    func configureFont() {
        self.textColor = .darkGray
    }
}
