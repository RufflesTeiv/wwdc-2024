//
//  EnemyController.swift
//
//
//  Created by Rafa (Ruffles) on 20/02/24.
//

import Foundation

class EnemyController : ObservableObject {
    let uiController = UiController.shared
    
    let enemy : Enemy
    
    var enemyDefeatedListeners: [() -> Void] = []
    
    var health : Int
    var lastQuestionIdentifier : String = ""
    var lastQuestionIndex : Int = -1
    var questionController : QuestionController?
    
    init(enemy: Enemy) {
        self.enemy = enemy
        
        health = enemy.maxHealth
        uiController.setEnemyHealth(health, maxHealth: enemy.maxHealth)
        
        nextQuestion()
    }
    
    func nextQuestion() {
        let randomConcept = enemy.concepts.randomElement()
        var possibleQuestions = randomConcept?.questions
            .filter { enemy.layoutOptions.contains($0.layout) }
        let nextQuestion : Question
        
        if enemy.randomQuestions {
            possibleQuestions = possibleQuestions!.filter { $0.identifier != lastQuestionIdentifier }
            nextQuestion = (possibleQuestions?.randomElement())!
            lastQuestionIdentifier = nextQuestion.identifier
        } else {
            lastQuestionIndex += 1
            nextQuestion = possibleQuestions![lastQuestionIndex]
        }
        
        questionController = QuestionController(question: nextQuestion, randomQuestions: enemy.randomQuestions)
        questionController?.questionAnsweredListeners.append { correct in
            if correct {
                self.takeDamage()
            }
            else {
                GameController.shared.damagePlayer(damage: self.enemy.damage)
            }
            self.nextQuestion()
        }
    }
    
    func takeDamage(damage: Int = 1) {
        health -= damage
        uiController.setEnemyHealth(health)
        
        if (health <= 0) {
            for listener in enemyDefeatedListeners {
                listener()
            }
        }
    }
}
