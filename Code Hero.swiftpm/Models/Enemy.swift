//
//  Enemy.swift
//
//
//  Created by Rafa (Ruffles) on 20/02/24.
//

import Foundation

class Enemy : RIdentifiable {
    let maxHealth: Int
    let layoutOptions: [Question.Layout]
    let concepts: [Concept]
    
    init(name: String, maxHealth: Int, layoutOptions: [Question.Layout], concepts: [Concept]) {
        self.maxHealth = maxHealth
        self.layoutOptions = layoutOptions
        self.concepts = concepts
        super.init(name: name)
    }
}
