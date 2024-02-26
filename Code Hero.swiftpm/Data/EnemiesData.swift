//
//  EnemiesData.swift
//
//
//  Created by Rafa (Ruffles) on 26/02/24.
//

import Foundation

class EnemiesData {
    static let enemies: [Enemy] = [
        Enemy(
            name: "Namecrate",
            maxHealth: 8,
            damage: 0,
            layoutOptions: [.list],
            concepts: [ConceptsData.getConceptByIdentifier(identifier: "variable-names")!],
            randomQuestions: false
        )
    ]
    
    static func getEnemyByIdentifier(identifier : String) -> Enemy? {
        let tryEnemy = enemies.filter {
            $0.identifier == identifier
        }
        
        return tryEnemy.first
    }
}
