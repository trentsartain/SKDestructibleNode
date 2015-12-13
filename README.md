# SKDestructibleNode
This is an extension of the SKSpriteNode class and allows for destructible image nodes. It allows for an image to be rendered and used as an SKSpriteNode with the added feature of being able to be destroyed on command.  

The image is broken up into square pieces and torn apart.  

### Usage

```swift
let node = SKDestructibleNode(imageName: "SinisterClown.png", scene: self, initialPosition: center, pieceSize: 25)

node.destroy()
```

The SKDestructibleNode class takes care of matching the original nodes position, rotation, velocity, etc.  

### Examples

![Mario](MarioBreak.gif)
![Bacon](BaconCrumble.gif)
![Clown](ClownDestruction.gif)
