//
//  EnemyController.swift
//
//
//  Created by Rafa (Ruffles) on 20/02/24.
//

import Foundation

class EnemyController : ObservableObject {
    let enemy : Enemy
    
    var enemyDefeatedListeners: [() -> Void] = []
    
    var health : Int
    var lastQuestionIdentifier : String = ""
    var questionController : QuestionController?
    
    init(enemy: Enemy) {
        self.enemy = enemy
        
        health = enemy.maxHealth
        
        nextQuestion()
    }
    
    func nextQuestion() {
        let randomConcept = enemy.concepts.randomElement()
        let possibleQuestions = randomConcept?.questions
            .filter { $0.identifier != lastQuestionIdentifier }
            .filter { enemy.layoutOptions.contains($0.layout) }
        
        questionController = QuestionController(question: (possibleQuestions?.randomElement())!)
        questionController?.questionAnsweredListeners.append { correct in
            if correct {
                self.takeDamage()
            }
            else {
                GameController.shared.damagePlayer()
            }
            self.nextQuestion()
        }
    }
    
    func takeDamage(damage: Int = 1) {
        health -= damage
        if (health <= 0) {
            for listener in enemyDefeatedListeners {
                listener()
            }
        }
    }
}
