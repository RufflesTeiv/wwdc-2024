//
//  Player.swift
//
//
//  Created by Rafa (Ruffles) on 20/02/24.
//

import Foundation

class Player {
    var maxHealth : Int = 5
    var health : Int = 0
    
    init() {
        regenerateHealth()
    }
    
    // Public functions
    public func regenerateHealth() {
        health = maxHealth
    }
    
    public func takeDamage(damage : Int = 1) {
        health -= damage
    }
}
