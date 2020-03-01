//
//  MenuScene.swift
//  SpaceExplosion
//
//  Created by Sebastian Giurgiu on 01/03/2020.
//  Copyright © 2020 Sebastian Giurgiu. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    var starfield:SKEmitterNode!
    
    var newGameButtonNode:SKSpriteNode!
    var difficultyButtonNode:SKSpriteNode!
    var difficultyLabelNode:SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        
        print("aparitie meniu")
        
        starfield = self.childNode(withName: "starfield") as? SKEmitterNode
        starfield.advanceSimulationTime(10)
        
        newGameButtonNode = self.childNode(withName: "newGameButton") as? SKSpriteNode
        difficultyButtonNode = self.childNode(withName: "difficultyButton") as? SKSpriteNode
        
        difficultyButtonNode.texture = SKTexture(imageNamed: "difficultyButton")
        
        difficultyLabelNode = self.childNode(withName: "difficultyLabel") as? SKLabelNode
        
        let userDefaults = UserDefaults.standard
        
        if userDefaults.bool(forKey: "hard") {
            difficultyLabelNode.text = "Hard"
        } else {
            difficultyLabelNode.text = "Easy"
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print("Incepe jocul....")
        
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "newGameButton" {
                let transation = SKTransition.flipHorizontal(withDuration: 0.5)
                let gameScene = GameScene(size: self.size)
                print("Din meniu spre joc")
                print(self.size)
                self.view?.presentScene(gameScene, transition: transation)
            } else if nodesArray.first?.name == "difficultyButton" {
                changeDifficulty()
            }
        }
    }
    
    func changeDifficulty() {
        let userDefaults = UserDefaults.standard
        
        if difficultyLabelNode.text == "Easy" {
            difficultyLabelNode.text = "Hard"
            userDefaults.set(true, forKey: "hard")
        } else {
            difficultyLabelNode.text = "Easy"
            userDefaults.set(false, forKey: "hard")
        }
        
        userDefaults.synchronize()
    }
    
    
    
    
    
}
