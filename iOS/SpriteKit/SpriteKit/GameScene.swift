//
//  GameScene.swift
//  SpriteKit
//
//  Created by Jonathon Manning on 12/08/2014.
//  Copyright (c) 2014 Jonathon Manning. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene {
    
    /*
    // BEGIN custom_scene_setup
    override func didMoveToView(view: SKView!) {
        self.scaleMode = .AspectFill
        
        let label = SKLabelNode(text: "Hello")
        label.position = CGPoint(x: size.width / 2.0, y: size.height / 2.0)
        
        self.addChild(label)
        
    }
    // END custom_scene_setup
    */
    
    override func didMoveToView(view: SKView) {
        
        self.scaleMode = .AspectFill
        
        let label = SKLabelNode(text: "Hello")
        label.position = CGPoint(x: size.width / 2.0, y: size.height / 2.0)
        
        self.addChild(label)
        
        
        // BEGIN sprite_node
        // Create the sprite
        let spriteNode = SKSpriteNode(imageNamed: "BlockSquareBlue")
        
        // Position the sprite right in the center of the scene
        spriteNode.position = CGPoint(x: size.width / 2.0,
                                      y: size.height / 2.0)
        
        // Add the sprite
        self.addChild(spriteNode)
        // END sprite_node
        
        
        
        // BEGIN texture_subregion
        let texture = SKTexture(imageNamed: "BlockSquareRed")
        let rect = CGRect(x: 0.25, y: 0.25, width: 0.5, height: 0.5)
        let subTexture = SKTexture(rect: rect, inTexture: texture)
        // END texture_subregion
        
        let subTextureSprite = SKSpriteNode(texture: subTexture);
        subTextureSprite.position = spriteNode.position
        subTextureSprite.position.y += 100
        
        subTextureSprite.setScale(0.5)
        
        self.addChild(subTextureSprite)
        
        
        // BEGIN texture_atlas
        let atlas = SKTextureAtlas(named: "Sprites")
        
        let textureInAtlas = atlas.textureNamed("BlockSquareBlue")
        // END texture_atlas
        
        // BEGIN texture_atlas_listing
        let textureNames = atlas.textureNames as! [String]
        // END texture_atlas_listing
        
        // BEGIN node_removing
        label.removeFromParent()
        // END node_removing
        
        // BEGIN text_creating
        let textLabel = SKLabelNode(text: "This is some text")
        // END text_creating
        
        // BEGIN text_finding_fonts
        for familyName in UIFont.familyNames() as! [String] {
            for fontName in UIFont.fontNamesForFamilyName(familyName)
                as! [String] {
                println(fontName)
            }
        }
        // END text_finding_fonts
        
        
        // BEGIN text_configuring_font
        textLabel.fontName = "Zapfino"
        textLabel.fontSize = 30
        textLabel.fontColor = UIColor.blueColor()
        // END text_configuring_font
        
        
        // Position it at 1/2 of the width of the screen, 1/5 of the screen 
        // from the bottom
        textLabel.position = CGPoint(x: self.size.width / 2.0, y: self.size.height / 5.0)
        
        // Alignment
        
        // BEGIN text_alignment
        textLabel.verticalAlignmentMode = .Top
        textLabel.horizontalAlignmentMode = .Left        
        // END text_alignment
        
        self.addChild(textLabel)
        
        
        // BEGIN action_move
        // Move upwards by 50 pixels
        let moveAction = SKAction.moveBy(CGVector(dx: 0, dy:50), duration: 1.0)
        // END action_move
        
        
        // BEGIN action_reversing
        // Move down by 50 pixels
        let moveBackAction = moveAction.reversedAction()
        // END action_reversing
        
        let moveSequence = SKAction.sequence([moveAction, moveBackAction])
        let repeatingMoveAction = SKAction.repeatActionForever(moveSequence)
        
        
        // BEGIN action_rotating
        // Rotate by half a circle (π radians) over 1 second
        let rotateAction = SKAction.rotateByAngle(CGFloat(M_PI), duration: 1.0)
        // END action_rotating
        
        
        // BEGIN action_scaling
        // Scale to double normal size over half a second
        let scaleAction = SKAction.scaleTo(2.0, duration: 0.5)
        // END action_scaling
        
        
        // BEGIN action_grouping
        // Grouping actions means the actions run together
        let rotateWhileScaling = SKAction.group([rotateAction, scaleAction])
        // END action_grouping
        
        // BEGIN action_sequence
        // Sequences mean the actions run one after the other
        let rotateThenScale = SKAction.sequence([rotateAction, scaleAction])
        // END action_sequence
        
        
        // BEGIN action_running
        // Run an action on a node using runAction
        textLabel.runAction(repeatingMoveAction)
        // END action_running
        
        // Shape nodes
        
    // BEGIN shapenode_creating
    let shapeNode = SKShapeNode(rectOfSize: CGSize(width: 50.0, height: 50.0))
    // END shapenode_creating
        
        // BEGIN shapenode_creating_with_uibezierpath
                // Can also provide a custom path
                let path = UIBezierPath(ovalInRect: CGRect(x: 0,
                                                           y: 0,
                                                           width: 50,
                                                           height: 70))
                let shapeNodeWithPath = SKShapeNode(path: path.CGPath,
                                                    centered: true)
        // END shapenode_creating_with_uibezierpath
        
        
        // BEGIN shapenode_configuring
        shapeNode.lineWidth = 4.0
        shapeNode.lineCap = kCGLineCapRound
        shapeNode.strokeColor = UIColor.whiteColor()
        shapeNode.fillColor = UIColor.redColor()
        shapeNode.glowWidth = 4.0
        // END shapenode_configuring
        
        shapeNode.position = CGPoint(x: 150, y: 300)
        
        self.addChild(shapeNode)
        
        // Image effects
        
        // BEGIN effects_filters
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter.setDefaults()
        blurFilter.setValue(5.0, forKey: "inputRadius")
        // END effects_filters
        
        // BEGIN effects_effectnodes
        let blurEffectNode = SKEffectNode()
        blurEffectNode.filter = blurFilter
        blurEffectNode.shouldEnableEffects = true
        self.addChild(blurEffectNode)
        // END effects_effectnodes
        
        
        //spriteNode.removeFromParent()
        
        /*
        // BEGIN effects_applying_to_nodes
        // 'spriteNode' will be blurred
        blurEffectNode.addChild(spriteNode)
        // END effects_applying_to_nodes
        */
        
        /*
        
        // BEGIN effects_applying_to_scene
        self.filter = blurFilter
        // END effects_applying_to_scene
        */
        
        // Physics
        
        
        // BEGIN physics_creating_body
        let body = SKPhysicsBody(rectangleOfSize: shapeNode.frame.size)
        shapeNode.physicsBody = body
        // END physics_creating_body

        // BEGIN physics_adding_body_to_node
        // END physics_adding_body_to_node
        
        // BEGIN physics_configuring_mass
        body.mass = 1.0
        // END physics_configuring_mass
        
        // BEGIN physics_debugging
        self.view?.showsPhysics = true
        // END physics_debugging
        
        // Walls
        
        
        // BEGIN physics_walls_from_edge_loop
        let wallsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        // END physics_walls_from_edge_loop
        
        
        // BEGIN physics_adding_body_to_scene
        self.physicsBody = wallsBody
        // END physics_adding_body_to_scene
        
        // Joints
        
        let radius : CGFloat = 25.0
        let hingeNode = SKShapeNode(circleOfRadius: radius)
        hingeNode.position = CGPointMake(200, 400)
        
        // BEGIN joints_node_setup
        let hingeBody = SKPhysicsBody(circleOfRadius: radius)
        hingeBody.dynamic = false

        hingeNode.physicsBody = hingeBody
        
        self.addChild(hingeNode)
        // END joints_node_setup
        
        
// BEGIN joints_creating
let pinJoint = SKPhysicsJointPin.jointWithBodyA(hingeNode.physicsBody,
                                                bodyB: shapeNode.physicsBody,
                                                anchor: hingeNode.position)

self.physicsWorld.addJoint(pinJoint)
// END joints_creating
        
        
        
        // Lights
        
        // BEGIN lights_setup        
        let light = SKLightNode()
        light.enabled = true
        light.lightColor = UIColor.yellowColor()
        // END lights_setup

        light.position = CGPointZero

        self.addChild(light)
        
        
        // BEGIN lights_category_mask
        // Light all nodes
        light.categoryBitMask = 0xFFFFFFFF
        
        // This node will be lit, because 0xFFFFFFFF AND 0x1 = true
        spriteNode.lightingBitMask = 0x1
        // END lights_category_mask
        
        
        //
        
        // Constraints
        
        let pointingNode = SKShapeNode(rectOfSize: CGSizeMake(50, 10))
        pointingNode.fillColor = UIColor.greenColor()
        pointingNode.position = CGPoint(x: 200, y: 300)
        
        // BEGIN constraints_point_at
        let pointAtConstraint = SKConstraint.orientToNode(
            shapeNode, offset: SKRange(constantValue: 0.0))
        
        pointingNode.constraints = [pointAtConstraint]
        // END constraints_point_at
        
        self.addChild(pointingNode)
        
        // Custom shader
        
        // BEGIN custom_shader_basic
        let shader = SKShader(fileNamed: "CustomShader")
        spriteNode.shader = shader
        // END custom_shader_basic

        // BEGIN noise_shader_uniforms
        let noiseTexture = SKTexture(noiseWithSmoothness: 0.5,
                                     size: CGSize(width: 256, height: 256),
                                     grayscale: true)
        let textureUniform = SKUniform(name: "noiseTexture",
                                       texture: noiseTexture)
        let thresholdUniform = SKUniform(name: "threshold", float: 0.5);
        
        shader.addUniform(textureUniform)
        shader.addUniform(thresholdUniform)
        // END noise_shader_uniforms
        
}
    
    
    
}
