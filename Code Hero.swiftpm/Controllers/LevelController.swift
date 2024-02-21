//
//  LevelController.swift
//  Code Hero
//
//  Created by Rafa (Ruffles) on 20/02/24.
//

import Foundation

class LevelController : ObservableObject {
    let level : Level
    var enemyController : EnemyController?
    var currentEnemyIndex : Int = -1
    
    var levelCompletedListeners : [()->Void] = []
    
    init(level: Level) {
        self.level = level
        nextEnemy()
    }
    
    func nextEnemy() {
        currentEnemyIndex += 1
        
        if (currentEnemyIndex < level.enemies.count) {
            let newEnemy = level.enemies[currentEnemyIndex]
            
            enemyController = EnemyController(enemy: newEnemy)
            enemyController?.enemyDefeatedListeners.append {
                self.nextEnemy()
            }
        }
        else {
            for listener in levelCompletedListeners {
                listener()
            }
        }
    }
}
