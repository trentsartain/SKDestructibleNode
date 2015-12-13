# SKDestructibleNode
This is an extension of the SKSpriteNode class and allows for destructible image nodes. It allows for an image to be rendered and used as an SKSpriteNode with the added feature of being able to be destroyed on command.  

The image is broken up into square pieces and torn apart.  Physics bodies are created based on the alpha of the piece.  Therefore, more intricate pieces will have more intricate physics bodies (and will therefore have a performance impact).  All in all, the performance stays relatively good for most images. 

### Usage

The code for the SKDestructibleNode class can be found in SKDestructibleNode.swift.

To create a piece broken with squares:

```swift
let node = SKDestructibleNode(imageName: "SinisterClown.png", scene: self, pieceSize: 25)
node.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
self.addChild(node)

//The broken pieces are returned as an array of SKSpriteNodes
let pieces = node.destroy()
```
To create a piece broken with rectangles of a certain size:
```swift
let node = SKDestructibleNode(imageName: "SinisterClown.png", scene: self, rectSize: CGSize(width: 50, height: 20))
node.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
self.addChild(node)

//The broken pieces are returned as an array of SKSpriteNodes
let pieces = node.destroy()
```
The SKDestructibleNode class takes care of matching the original nodes position, rotation, velocity, etc.  

### Examples

![Mario](MarioBreak.gif)
![Bacon](BaconCrumble.gif)
![Clown](ClownDestruction.gif)

### Caveats

* Creating the physicsBodies this way is expensive.  The simpler the image, the better the performance will be.  Squares and circles work best. 
* You will need to mess with the number of pieces for the given image.  The pieces are stored so that they can be instantly added to the scene upon destruction.  This means that the more pieces required to compose the image, the more memory will be eaten.
* Some images just don't work well with this.  Images with lots of detail (with alpha) will slow performance to a crawl. I'm working on some optimizations. 
* There is apparently a bug where physics bodies don't actually touch.  This is why there is a small amount of space between the pieces.  I'm working on finding a fix for this. 

### What's next?

* Optimizations
* Random/different piece sizes
* Options for how the image breaks (explosions, fadeouts, etc)
