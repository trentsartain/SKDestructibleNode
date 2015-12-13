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
    var destructibleNode = SKDestructibleNode()
    
    override func didMoveToView(view: SKView) {
        setupScene()
        addDestructibleNode()
    }
    
    override func update(currentTime: CFTimeInterval) {
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let pieces = destructibleNode.destroy()
        print(pieces.count)
    }
    
    func setupScene() {
        center = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.backgroundColor = UIColor.whiteColor()
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -1.5)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
    }
    
    func addDestructibleNode() {
        destructibleNode = SKDestructibleNode(imageName: "SinisterClown.png", scene: self, pieceSize: 25)
        destructibleNode.position = center
        self.addChild(destructibleNode)
    }
}