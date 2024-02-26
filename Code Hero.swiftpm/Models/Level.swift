//
//  Level.swift
//
//
//  Created by Rafa (Ruffles) on 20/02/24.
//

import Foundation

class Level : RIdentifiable {
    let enemies: [Enemy]
    let finalEnemy: Enemy
    let enemyCount: Int
    let initialPrompt : String
    let finalPrompt : String
    
    init(name: String, enemies: [Enemy], finalEnemy: Enemy, enemyCount : Int, initialPrompt: String, finalPrompt: String) {
        self.enemies = enemies
        self.finalEnemy = finalEnemy
        self.enemyCount = enemyCount
        self.initialPrompt = initialPrompt
        self.finalPrompt = finalPrompt
        super.init(name: name)
    }
}
