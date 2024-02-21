//
//  Question.swift
//
//
//  Created by Rafa (Ruffles) on 20/02/24.
//

import Foundation

class Question : RIdentifiable {
    enum Layout {
        case list, grid, match, write
    }
    
    let description: String
    let layout: Question.Layout
    let options: [Option]
    
    init(name: String, description: String, layout: Question.Layout, options: [Option]) {
        self.description = description
        self.layout = layout
        self.options = options
        super.init(name: name)
    }
}
