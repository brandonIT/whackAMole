//
//  GameScene.swift
//  whackAMole
//
//  Created by xcode on 2/19/20.
//  Copyright © 2020 xcode. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    var goodMoleSprite:SKSpriteNode?
    var hitMoleTexture:SKTexture?
    var goodMoleTexture:SKTexture?
    var xCoord:Int = 0
    var yCoord:Int = 0
    var xNumber = 0
    //x can't be less than -3 or greater than 3
    var yNumber = 0
    //y can't be less than -5 greater than 10
    var molesHit:Int = 0
    var molesCount:Int = 0
    var count:Int = 0
    
    
    override func didMove(to view: SKView)
    {
        goodMoleSprite = self.childNode(withName: "goodMoleSprite") as? SKSpriteNode
        goodMoleTexture = SKTexture(imageNamed: "goodMole")
        hitMoleTexture = SKTexture(imageNamed: "hitMole")
        startGame()
    }
    
    func startGame()
    {
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { timer in
                print("Timer fired!")
                self.count += 1

                self.xNumber = Int.random(in: -3 ..< 3)
                self.yNumber = Int.random(in: -5 ..< 10)
                self.xCoord = self.xNumber
                self.yCoord = self.yNumber
                self.goodMoleSprite?.anchorPoint = CGPoint(x: self.xCoord, y: self.yCoord)
                
            if self.count == 3 {
                timer.invalidate()
            }
            
            self.molesCount += 1
            self.goodMoleSprite?.texture = self.goodMoleTexture
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact)
    {
    }
    
    
    func touchDown(atPoint pos : CGPoint)
    {
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
    }
    
    func touchUp(atPoint pos : CGPoint)
    {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        let touch = touches.first!
        if (goodMoleSprite?.contains(touch.location(in: self)))!
        {
            molesHit += 1
            goodMoleSprite?.texture = hitMoleTexture
            print("Moles hit: \(molesHit)")
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {

    }
    
}
