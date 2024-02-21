//
//  GameController.swift
//  Code Hero
//
//  Created by Rafa (Ruffles) on 20/02/24.
//

import Foundation
import SwiftUI

class GameController : ObservableObject {
    static var shared: GameController = {
        let instance = GameController()
        return instance
    }()
    
    var currentSceneName: String = ""
    var levelController : LevelController?
   
    var player : Player = Player()
    var knownConceptNames: [String] = []
    
    private init(){
        // Cutscene
        
        // First level
        // Other levels
        
        // Ending
    }
    
    func startLevel(level: Level) {
        levelController = LevelController(level: level)
        levelController?.levelCompletedListeners.append {
            self.endLevel(success: true)
        }
        player.regenerateHealth()
    }
    
    func endLevel(success: Bool) {
        // TODO: Create level advancement logic
        levelController = nil
    }
    
    // Public functions
    public func checkNewConcept(concept: Concept) {
        if !knownConceptNames.contains(concept.name) {
            // TODO: show new concept
            knownConceptNames.append(concept.name)
        }
    }
    
    public func damagePlayer(damage: Int = 1) {
        player.takeDamage(damage: damage)
        
        if (player.health <= 0 && levelController != nil) {
            endLevel(success: false)
        }
    }
}
