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
   
    @Published var knownConceptNames: [String] = []
    @Published var player : Player = Player()
    @Published var playerHealth : Int = 0
    
    private init(){
        // Cutscene
        
        // First level
        startLevel(level: LevelsData.levels[0])
        // Other levels
        
        // Ending
    }
    
    func startLevel(level: Level) {
        levelController = LevelController(level: level)
        levelController?.levelCompletedListeners.append {
            self.endLevel(success: true)
        }
        regeneratePlayerHealth()
    }
    
    func endLevel(success: Bool) {
        // TODO: Create level advancement logic
        levelController = nil
    }
    
    func regeneratePlayerHealth() {
        playerHealth = player.maxHealth
    }
    
    // Public functions
    public func checkNewConcept(concept: Concept) {
        if !knownConceptNames.contains(concept.name) {
            // TODO: show new concept
            knownConceptNames.append(concept.name)
        }
    }
    
    public func damagePlayer(damage: Int = 1) {
        playerHealth -= damage
        
        if (playerHealth <= 0 && levelController != nil) {
            endLevel(success: false)
        }
    }
}
