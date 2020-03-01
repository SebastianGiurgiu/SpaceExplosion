//
//  GameOverScene.swift
//  SpaceExplosion
//
//  Created by Sebastian Giurgiu on 01/03/2020.
//  Copyright © 2020 Sebastian Giurgiu. All rights reserved.
//

import UIKit
import SpriteKit

class GameOverScene: SKScene {
    
    var score:Int = 0
    
    var scoreLabel:SKLabelNode!
    var newGameButtonNode:SKSpriteNode!
    
    
    override func didMove(to view: SKView) {
        
        scoreLabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
        scoreLabel.text = "\(score)"
        
        newGameButtonNode = self.childNode(withName: "newGameButton") as! SKSpriteNode
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self) {
            let node = self.nodes(at: location)
            
            if node[0].name == "newGameButton" {
                let transation = SKTransition.flipHorizontal(withDuration: 0.5)
                print("Din final spre joc")
                print(self.size)
                let gameScene = GameScene(size: self.size)
                self.view!.presentScene(gameScene, transition: transation)
            }
        }
    }
    
    

}
