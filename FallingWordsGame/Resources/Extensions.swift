//
//  Extensions.swift
//  FallingWordsGame
//
//  Created by VAROL AKSOY on 12.09.2021.
//  Copyright © 2021 VAROL AKSOY. All rights reserved.
//

import Foundation
//MARK: - Arrays
public extension Collection where Indices.Iterator.Element == Index {
  /// Returns the element at the specified index iff it is within bounds, otherwise nil.
  subscript (safe index: Index) -> Iterator.Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
