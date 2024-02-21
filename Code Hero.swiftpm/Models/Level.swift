//
//  Level.swift
//
//
//  Created by Rafa (Ruffles) on 20/02/24.
//

import Foundation

class Level : RIdentifiable {
    let enemies: [Enemy]
    
    init(name: String, enemies: [Enemy]) {
        self.enemies = enemies
        super.init(name: name)
    }
}
