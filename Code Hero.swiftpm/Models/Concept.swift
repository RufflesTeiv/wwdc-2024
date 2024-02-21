//
//  Concept.swift
//
//
//  Created by Rafa (Ruffles) on 20/02/24.
//

import Foundation

class Concept : RIdentifiable {
    let description : String
    let questions : [Question]
    
    init(name: String, description: String, questions: [Question]) {
        self.description = description
        self.questions = questions
        super.init(name: name)
    }
    
    
}
