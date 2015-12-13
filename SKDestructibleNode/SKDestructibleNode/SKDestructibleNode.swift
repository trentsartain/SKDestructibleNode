//
//  SKDestructibleNode.swift
//  SKDestructibleNode
//
//  Created by Trent Sartain on 12/13/15.
//  Copyright © 2015 Trent Sartain. All rights reserved.
//


import SpriteKit

class SKDestructibleNode : SKSpriteNode {
    var pieces = Array<SKSpriteNode>()
    var isDestroyed = false
    var nodeScene : SKScene
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        nodeScene = SKScene()
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(imageName: String, scene: SKScene, initialPosition: CGPoint, pieceSize : CGFloat){
        self.init(imageNamed: imageName)
        self.position = initialPosition
        self.nodeScene = scene
        
        let xScale = (pieceSize / self.size.width)
        let yScale = (pieceSize / self.size.height)
        
        let numSquaresAcross = Int(self.size.width / pieceSize) + 1
        let numSquaresUp = Int(self.size.height / pieceSize) + 1
        
        let clone = SKSpriteNode(imageNamed: imageName)
        
        for var i = 0; i < numSquaresAcross; i++ {
            for var j = 0; j < numSquaresUp; j++ {
                let crop = SKCropNode()
                let mask = SKSpriteNode(color: UIColor.blackColor(), size: CGSize(width: pieceSize, height: pieceSize))
                mask.position = CGPoint(x: (CGFloat(i) * (pieceSize)) + (pieceSize/2) - self.size.width/2, y: (CGFloat(j) * (pieceSize)) + (pieceSize/2) - self.size.height/2)
                
                crop.addChild(clone)
                crop.maskNode = mask
                crop.position = self.position
                
                let spriteNode = SKSpriteNode(texture: scene.view?.textureFromNode(crop), size: CGSize(width: pieceSize / xScale, height: pieceSize / yScale))
                
                spriteNode.position = crop.position
                spriteNode.physicsBody = SKPhysicsBody(texture: spriteNode.texture!, alphaThreshold: 0.01, size: spriteNode.size)
                
                //TODO: Images with no content fail to create physicsBodies.
                if spriteNode.physicsBody == nil { continue }
                
                pieces.append(spriteNode)
            }
        }
        
    }
    
    func destroy() -> Array<SKSpriteNode> {
        if isDestroyed { return Array<SKSpriteNode>() }
        isDestroyed = true
        
        var angularVelocity : CGFloat = 0
        if let body = self.physicsBody {
            angularVelocity = body.angularVelocity
        }
        
        for piece in pieces {
            piece.xScale = self.xScale
            piece.yScale = self.yScale
            piece.position = self.position
            piece.zRotation = self.zRotation
            piece.physicsBody?.angularVelocity = angularVelocity
            
            nodeScene.addChild(piece)
        }
        
        self.removeFromParent()
        return self.pieces
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}