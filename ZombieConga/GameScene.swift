//
//  GameScene.swift
//  ZombieConga
//
//  Created by Yuangang Sheng on 2018/5/26.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let zombie = SKSpriteNode(imageNamed: "zombie1")
    var lastUpdateTime:TimeInterval = 0
    var dt: TimeInterval = 0
    let zombieMovePointPerSec:CGFloat = 480.0
    let zombieRotateRadiansPerSec:CGFloat = 4.0 * π
    var velocity = CGPoint.zero
    
    let playableRect: CGRect
    
    var lastTouchLocation: CGPoint?
    
    override init(size: CGSize) {
        let maxAspectRatio:CGFloat = 16.0/9.0 // 1
        let playableHeight = size.width / maxAspectRatio // 2
        let playableMargin = (size.height-playableHeight)/2.0 // 3
        playableRect = CGRect(x: 0, y: playableMargin,
                              width: size.width,
                              height: playableHeight) // 4
        super.init(size: size) // 5
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented") // 6
    }
    
    func debugDrawPlayableArea() {
        let shape = SKShapeNode()
        let path = CGMutablePath()
        path.addRect(playableRect)
        shape.path = path
        shape.strokeColor = UIColor.red
        shape.lineWidth = 8.0
        addChild(shape)
    }
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
//        background.anchorPoint = CGPoint.zero
//        background.position = CGPoint.zero
        
//        background.zRotation = CGFloat.pi/8
        background.zPosition = -1
        addChild(background)
        
        let mSize = background.size
        print("Background Size:\(mSize)")
       
//        zombie.setScale(2)
        zombie.position = CGPoint(x: 400, y: 400)
        addChild(zombie)
        
        debugDrawPlayableArea()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        }else{
            dt = 0
        }
        lastUpdateTime = currentTime
        print("\(dt*1000) milliseconds since last update")
//        moveSprite(zombie,
//                   velocity: CGPoint(x: zombieMovePointPerSec, y: 0))
//        zombie.position = CGPoint(x: zombie.position.x + 8, y: zombie.position.y)
        
        if let lastTouchLocation = lastTouchLocation {
            let diff = lastTouchLocation - zombie.position
            if (diff.length() <= zombieMovePointPerSec * CGFloat(dt)) {
                zombie.position = lastTouchLocation
                velocity = CGPoint.zero
            } else {
                moveSprite(zombie, velocity: velocity)
                rotateSprite(sprite: zombie, direction: velocity)
            }
        }
        
        boundsCheckZombie()
    }
    
    func rotateSprite(sprite: SKSpriteNode, direction: CGPoint) {
        sprite.zRotation = direction.angle
//        sprite.zRotation = CGFloat(
//            atan2(Double(direction.y), Double(direction.x)))
    }
    
    func boundsCheckZombie() {
        let bottomLeft = CGPoint(x: 0, y: playableRect.minY)
        let topRight = CGPoint(x: size.width, y: playableRect.maxY)

        if zombie.position.x <= bottomLeft.x {
            zombie.position.x = bottomLeft.x
            velocity.x = -velocity.x
        }
        if zombie.position.x >= topRight.x {
            zombie.position.x = topRight.x
            velocity.x = -velocity.x
        }
        if zombie.position.y <= bottomLeft.y {
            zombie.position.y = bottomLeft.y
            velocity.y = -velocity.y
        }
        if zombie.position.y >= topRight.y {
            zombie.position.y = topRight.y
            velocity.y = -velocity.y
        }
    }
    
    func moveZombieToward(location: CGPoint) {
        let offset = location - zombie.position
        let direction = offset.normalized()
        velocity = direction * zombieMovePointPerSec
    }

    func moveSprite(_ sprite:SKSpriteNode, velocity:CGPoint) {
        // 1
        let amountToMove = velocity * CGFloat(dt)
        print("Amount to move: \(amountToMove)")
        // 2
        sprite.position += amountToMove
    }
    
    
    func rotateSprite(sprite: SKSpriteNode, direction: CGPoint,
                      rotateRadiansPerSec: CGFloat) {
        // Your code here!
        
    }
    
    func sceneTouched(touchLocation:CGPoint) {
        lastTouchLocation = touchLocation
        moveZombieToward(location: touchLocation)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        sceneTouched(touchLocation: touchLocation)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        sceneTouched(touchLocation: touchLocation)
    }
}
