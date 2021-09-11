//
//  WordModel.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import Foundation

// MARK: - WordElement
struct WordElement: Codable {
    let textEng, textSPA: String

    enum CodingKeys: String, CodingKey {
        case textEng = "text_eng"
        case textSPA = "text_spa"
    }
}

typealias Word = [WordElement]
