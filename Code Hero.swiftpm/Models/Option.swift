//
//  Option.swift
//  
//
//  Created by Rafa (Ruffles) on 20/02/24.
//

import Foundation
import SwiftUI

class Option : Hashable {
    public static func == (lhs: Option, rhs: Option) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: String {
        return UUID().uuidString
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    let text : String
    let correct : Bool
    let matchIdx : Int
    var matched : Bool = false
    var tintColor : Color = .white
    
    init(text: String, correct: Bool = false, matchIdx: Int = -1) {
        self.text = text
        self.correct = correct
        self.matchIdx = matchIdx
    }
    
    func reset() {
        matched = false
        tintColor = .white
    }
}
