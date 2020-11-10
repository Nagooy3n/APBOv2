//
//  EnemyNode.swift
//  APBOv2
//
//  Created by 90306670 on 11/4/20.
//  Copyright © 2020 Dhruv Chowdhary. All rights reserved.
//

import SpriteKit

class EnemyNode: SKSpriteNode {
    var type: EnemyType
    var lastFireTime: Double = 0
    var shields: Int
    var scoreinc: Int
    
    init(type: EnemyType, startPosition: CGPoint, xOffset: CGFloat, moveStright: Bool) {
        self.type = type
        shields = 1
        scoreinc = 10
        
        let texture = SKTexture(imageNamed: "turretbase")
        super.init(texture: texture, color: .white, size: texture.size())
        
        physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        physicsBody?.categoryBitMask = CollisionType.cannon.rawValue
        physicsBody?.collisionBitMask = CollisionType.player.rawValue | CollisionType.shot.rawValue
        physicsBody?.contactTestBitMask = CollisionType.player.rawValue | CollisionType.shot.rawValue
        name = "cannon"
        position = CGPoint(x: startPosition.x + xOffset, y: startPosition.y)
        
   //     configureMovement(moveStright)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("LOL NO")
    }
    /*
    func configureMovement(_ moveStright: Bool) {
        let path = UIBezierPath()
        path.move(to: .zero)
        
        if moveStright {
            path.addLine(to: CGPoint(x: -10000, y: 0))
        } else {
            path.addCurve(to: CGPoint(x: -3500, y: 0), controlPoint1: CGPoint(x: 0, y: -position.y*4), controlPoint2: CGPoint(x: -1000, y: -position.y))
        }
        
        let movement = SKAction.follow(path.cgPath, asOffset: true, orientToPath: true, speed: type.speed)
        let sequence = SKAction.sequence([movement, .removeFromParent()])
        run(sequence)
    }
 */
    /*
    func fire() {
        let weaponType = "\(type.name)Weapon"
        
        let weapon = SKSpriteNode(imageNamed: weaponType)
        weapon.name = "enemyWeapon"
        weapon.position = position
        weapon.zRotation = zRotation
        parent?.addChild(weapon)
        
        weapon.physicsBody = SKPhysicsBody(rectangleOf: weapon.size)
        weapon.physicsBody?.categoryBitMask = CollisionType.enemyWeapon.rawValue
        weapon.physicsBody?.collisionBitMask = CollisionType.player.rawValue
        weapon.physicsBody?.contactTestBitMask = CollisionType.player.rawValue
        weapon.physicsBody?.mass = 0.001
        
        let speed: CGFloat = 1
        let adjustedRotation = zRotation + (CGFloat.pi / 2)
        
        let dx = speed * cos(adjustedRotation)
        let dy = speed * sin(adjustedRotation)
        
        weapon.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))
        
        
    }
 */
}