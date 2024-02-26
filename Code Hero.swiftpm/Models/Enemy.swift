//
//  Enemy.swift
//
//
//  Created by Rafa (Ruffles) on 20/02/24.
//

import Foundation

class Enemy : RIdentifiable {
    let maxHealth: Int
    let damage : Int
    let layoutOptions: [Question.Layout]
    let concepts: [Concept]
    let allowTips : Bool
    let randomQuestions : Bool
    
    init(name: String, maxHealth: Int, damage: Int, layoutOptions: [Question.Layout], concepts: [Concept], allowTips: Bool = true, randomQuestions: Bool = true) {
        self.maxHealth = maxHealth
        self.damage = damage
        self.layoutOptions = layoutOptions
        self.concepts = concepts
        self.allowTips = allowTips
        self.randomQuestions = randomQuestions
        super.init(name: name)
    }
}
