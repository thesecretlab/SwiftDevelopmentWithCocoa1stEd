//
//  ViewController.swift
//  SpriteKit
//
//  Created by Jonathon Manning on 12/08/2014.
//  Copyright (c) 2014 Jonathon Manning. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        // BEGIN scene_basic
        let scene = SKScene(size: self.view.bounds.size)
        
        scene.backgroundColor = UIColor.greenColor()
        
        let skView = self.view as SKView
        
        // BEGIN scene_present_direct
        skView.presentScene(scene)
        // END scene_present_direct
        // END scene_basic

        */
        
        /*
        // BEGIN scene_custom
        let scene = GameScene(size: self.view.bounds.size)
        
        let skView = self.view as SKView
        
        scene.scaleMode = .AspectFill
        scene.backgroundColor = UIColor.blackColor()
        
        skView.presentScene(scene)
        // END scene_custom
        */
        
        // BEGIN scene_transitions_menu
        
        let menuScene = MenuScene(size: self.view.bounds.size)
        
        let skView = self.view as SKView
        
        menuScene.scaleMode = .AspectFill
        skView.presentScene(menuScene)
        
        // END scene_transitions_menu

        
        /*
        // BEGIN scene_from_file
        let scene = GameScene(fileNamed: "GameScene")
        
        let skView = self.view as SKView
        
        skView.presentScene(scene)  
        // END scene_from_file
        */
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

