//
//  Option.swift
//  
//
//  Created by Rafa (Ruffles) on 20/02/24.
//

import Foundation

class Option {
    let text : String
    let correct : Bool
    let matchIdx : Int
    var matched : Bool = false
    
    init(text: String, correct: Bool = false, matchIdx: Int = -1) {
        self.text = text
        self.correct = correct
        self.matchIdx = matchIdx
    }
}
