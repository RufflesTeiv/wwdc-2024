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
    let spriteScale : CGFloat = 16
    let spriteSize : Int = 16
    
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
//        let background = SKShapeNode(rectOf: size)
        let background = SKUtils.setupPixelSpriteFromImage(scene: self, imageNamed: "background", spriteScale: 1.0, zPosition: -10.0)
        background.name = "background"
        background.position = CGPoint(x: size.width/2, y: size.height/2)
    }
    
    private func setupEnemy() {
        enemyNode = SKUtils.setupPixelSpriteFromImage(scene: self, imageNamed: "rato", spriteScale: spriteScale)
//        enemyNode = SKUtils.setupScaledRect(scene: self, name: "enemy", size: CGSize(width: spriteSize, height: spriteSize), color: .red, spriteScale: spriteScale)
        enemyNode.position = CGPoint(x: size.width + spriteTrueSize()/2.0, y: size.height-200)
        enemyNode.run(AnimationsData.enterRight)
    }
    
    private func setupPlayer() {
//        playerNode = SKUtils.setupScaledRect(scene: self, name: "player", size: CGSize(width: spriteSize, height: spriteSize), color: .blue, spriteScale: spriteScale)
        playerNode = SKUtils.setupPixelSpriteFromImage(scene: self, imageNamed: "player", spriteScale: spriteScale)
        playerNode.position = CGPoint(x: -spriteTrueSize()/2.0, y: spriteTrueSize()/2.0)
        playerNode.run(AnimationsData.enterLeft)
        playerNode.run(AnimationsData.idle)
    }
    
    private func spriteTrueSize() -> Double {
        return CGFloat(spriteSize)*spriteScale
    }
    
}
