//
//  AnimationsData.swift
//
//
//  Created by Rafa (Ruffles) on 23/02/24.
//

import Foundation
import SpriteKit

class AnimationsData {
    // Parameters
    static let moveXPosition = 300.0
    static let moveInterval = 0.5
    
    // Variables
    static var spriteScale = 1.0
    static var scene : SKScene = SKScene()
    
    // Animations
    static var enterLeft: SKAction = SKAction()
    static var enterRight: SKAction = SKAction()
    static var idle: SKAction = SKAction()
    
    static func setupAnimations(scene : SKScene, spriteScale: CGFloat) {
        self.spriteScale = spriteScale
        self.scene = scene
        
        // Enter Left Animation
        enterLeft.timingMode = .easeInEaseOut
        enterLeft = SKAction.moveTo(x: moveXPosition, duration: moveInterval)
        
        // Enter Right Animation
        enterRight.timingMode = .easeInEaseOut
        enterRight = SKAction.moveTo(x: scene.size.width-moveXPosition, duration: moveInterval)
        
        // Idle Animation
        let goDown = SKAction.move(by: CGVector(dx: 0, dy: -8), duration: 1.0)
        goDown.timingMode = .easeInEaseOut
        let goUp = SKAction.move(by: CGVector(dx: 0, dy: 8), duration: 1.0)
        goUp.timingMode = .easeInEaseOut
        idle = SKAction.repeatForever(SKAction.sequence([goDown,goUp]))
    }
}
