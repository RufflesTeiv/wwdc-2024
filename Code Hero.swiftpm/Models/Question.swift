//
//  Question.swift
//
//
//  Created by Rafa (Ruffles) on 20/02/24.
//

import Foundation

class Question : RIdentifiable {
    static var placeholder = Question(name: "Placeholder", tip: "Placeholder", code: "Placeholder", layout: .list, options: [
        Option(text: "Option A"),
        Option(text: "Option B"),
        Option(text: "Option C")
    ])
    
    enum Layout {
        case list, grid, match, write
    }
    
    let tip: String
    let code: String
    let layout: Question.Layout
    var options: [Option]
    
    init(name: String, tip: String, code: String = "", layout: Question.Layout, options: [Option]) {
        self.tip = tip
        self.code = code
        self.layout = layout
        self.options = options
        super.init(name: name)
    }
}
