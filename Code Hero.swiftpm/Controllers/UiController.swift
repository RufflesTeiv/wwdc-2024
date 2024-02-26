//
//  UiController.swift
//
//
//  Created by Rafa (Ruffles) on 26/02/24.
//

import Foundation

class UiController : ObservableObject {
    static var shared: UiController = {
        let instance = UiController()
        return instance
    }()
    
    @Published var currentQuestion : Question = .placeholder
    @Published var enemyHealth : Int = 0
    @Published var enemyMaxHealth : Int = 0
    @Published var promptShown : Bool = false
    @Published var promptText : String = ""
    @Published var tipsAllowed : Bool = true
    
    var questionAnsweredListeners : [(Int)->Void] = []
    var promptClosedListeners : [()->Void] = []
    
    public func hidePrompt() {
        promptShown = false
        for listener in promptClosedListeners {
            listener()
        }
        promptClosedListeners.removeAll()
    }
    
    public func questionAnswered(index: Int) {
        for listener in questionAnsweredListeners {
            listener(index)
        }
    }
    
    public func setCurrentQuestion(question: Question) {
        questionAnsweredListeners.removeAll()
        currentQuestion = question
    }
    
    public func setEnemyHealth(_ health: Int, maxHealth : Int = -1) {
        enemyHealth = health
        if maxHealth > -1 {
            enemyMaxHealth = maxHealth
        }
    }
    
    public func setTipsAllowed(allowed: Bool) {
        tipsAllowed = allowed
    }
    
    public func showPrompt(text: String, closeListener: @escaping ()->Void = {}) {
        promptShown = true
        promptText = text
        
        promptClosedListeners.append(closeListener)
    }
}
