//
//  GameInteractor.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 11.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import Foundation

protocol GameInteractorInterface: class {
    func fetchWordData()
}

protocol GameInteractorOutput: class {
    func fetchWordDataOutput(result: WordResult)
}

typealias WordResult = Result<Word,Error>

final class GameInteractor {
    var output: GameInteractorOutput?
}

extension GameInteractor: GameInteractorInterface {
    func fetchWordData() {
        guard let path = Bundle.main.path(forResource: "words", ofType: "json") else { return }
        let result = decodeJSON(with: Word.self, path: path)
        self.output?.fetchWordDataOutput(result: result)
    }
    
    func decodeJSON <T: Decodable>(with type: T.Type, path: String) -> Result<T, Error> {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            let decoder = JSONDecoder()
            let result = try decoder.decode(type.self, from: data)
            return .success(result)
        } catch let error {
            return .failure(error)
        }
    }

}
