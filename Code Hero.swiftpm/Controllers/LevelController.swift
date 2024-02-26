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
    
    var enemiesFought : Int = 0
    var levelCompletedListeners : [()->Void] = []
    
    init(level: Level) {
        self.level = level
        
        showPrompt(text: level.initialPrompt, closeListener: nextEnemy)
    }
    
    func nextEnemy() {
        enemiesFought += 1
        
        if (enemiesFought < level.enemyCount) {
            initEnemy(newEnemy: level.enemies.randomElement()!)
        } else if (enemiesFought == level.enemyCount) {
            initEnemy(newEnemy: level.finalEnemy)
        } else {
            showPrompt(text: level.finalPrompt, closeListener: {
                for listener in self.levelCompletedListeners {
                    listener()
                }
            })
        }
    }
    
    func initEnemy(newEnemy: Enemy) {
        enemyController = EnemyController(enemy: newEnemy)
        enemyController?.enemyDefeatedListeners.append {
            self.nextEnemy()
        }
    }
    
    private func showPrompt(text: String, closeListener: @escaping ()->Void) {
        if (text != "") {
            UiController.shared.showPrompt(text: text, closeListener: closeListener)
        }
    }
}
