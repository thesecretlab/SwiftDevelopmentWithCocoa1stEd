//
//  MenuScene.swift
//  SpriteKit
//
//  Created by Jonathon Manning on 13/08/2014.
//  Copyright (c) 2014 Jonathon Manning. All rights reserved.
//

import UIKit
import SpriteKit

class MenuScene: SKScene {
   
    // BEGIN transition_menu_setup
    override func didMoveToView(view: SKView) {
        
        let label = SKLabelNode(text: "Welcome to My Awesome Game")
        label.fontSize = 20
        
        label.position = CGPoint(x: self.size.width / 2.0,
                                 y: self.size.height / 2.0)
        
        // BEGIN node_adding_child
        self.addChild(label)
        // END node_adding_child
        
    }
    // END transition_menu_setup
    
    // BEGIN transition_menu_touch
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let game = GameScene(size: self.size)
        
        // BEGIN scene_present_transition
        let transition = SKTransition.moveInWithDirection(
            SKTransitionDirection.Right, duration: 0.5)
        
        self.view?.presentScene(game, transition: transition)
        // END scene_present_transition
    }
    // END transition_menu_touch
    
}
