//
//  CombatScene.swift
//
//
//  Created by Rafa (Ruffles) on 23/02/24.
//

import Foundation
import SpriteKit

class CombatScene : SKScene {
    // Variables
    let spriteScale : CGFloat = 8
    let spriteSize : Int = 32
    
    // Nodes
    var playerNode : SKNode = SKNode()
    var enemyNode : SKNode = SKNode()
    
    // Event functions
    // "didMove" runs every time the scene is first presented by a view
    override func didMove(to view: SKView) {
        AnimationsData.setupAnimations(scene: self, spriteScale: spriteScale)
        setupBackground()
        setupEnemy()
        setupPlayer()
    }
    
    // Private functions
    private func setupBackground() {
        let background = SKShapeNode(rectOf: size)
        background.name = "background"
        background.fillColor = .green
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(background)
    }
    
    private func setupEnemy() {
        enemyNode = SKUtils.setupScaledRect(scene: self, name: "enemy", size: CGSize(width: spriteSize, height: spriteSize), color: .red, spriteScale: spriteScale)
        enemyNode.position = CGPoint(x: size.width + spriteTrueSize()/2.0, y: size.height-200)
        enemyNode.run(AnimationsData.enterRight)
    }
    
    private func setupPlayer() {
        playerNode = SKUtils.setupScaledRect(scene: self, name: "player", size: CGSize(width: spriteSize, height: spriteSize), color: .blue, spriteScale: spriteScale)
        playerNode.position = CGPoint(x: -spriteTrueSize()/2.0, y: spriteTrueSize()/2.0)
        playerNode.run(AnimationsData.enterLeft)
        playerNode.run(AnimationsData.idle)
    }
    
    private func spriteTrueSize() -> Double {
        return CGFloat(spriteSize)*spriteScale
    }
    
}
