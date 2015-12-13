//
//  GameScene.swift
//  SKDestructibleNode
//
//  Created by Trent Sartain on 12/13/15.
//  Copyright (c) 2015 Trent Sartain. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var center = CGPoint()
    var brokenNode = SKDestructibleNode()
    
    override func didMoveToView(view: SKView) {
        center = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.backgroundColor = UIColor.whiteColor()
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -1.5)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        
        brokenNode = SKDestructibleNode(imageName: "Mario.png", scene: self, initialPosition: center, pieceSize: 40)
        self.addChild(brokenNode)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let pieces = brokenNode.destroy()
        print(pieces.count)
    }
    
    override func update(currentTime: CFTimeInterval) {
        
    }
}