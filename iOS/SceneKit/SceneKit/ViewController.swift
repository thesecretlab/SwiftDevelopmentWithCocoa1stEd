//
//  ViewController.swift
//  SceneKit
//
//  Created by Jon Manning on 26/08/2014.
//  Copyright (c) 2014 Secret Lab. All rights reserved.
//

import UIKit
import SceneKit
import QuartzCore
import SpriteKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // BEGIN scene_background_color
        let sceneView = self.view as! SCNView
        sceneView.backgroundColor = UIColor.grayColor()                
        // END scene_background_color

        
        
        // Create scene
        
        // BEGIN scene_creating
        let scene = SCNScene()
        sceneView.scene = scene
        // END scene_creating        

        // BEGIN add_camera
        let camera = SCNCamera()
        camera.xFov = 45
        camera.yFov = 45
        // END add_camera
        
        // BEGIN camera_node
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 20)
        
        scene.rootNode.addChildNode(cameraNode)
        // END camera_node

        
        // BEGIN capsule_geometry
        let capsule = SCNCapsule(capRadius: 2.5, height: 10)
        // END capsule_geometry
        
        // BEGIN capsule_node
        let capsuleNode = SCNNode(geometry: capsule)
        capsuleNode.position = SCNVector3(x: 0, y: 0, z: 0)
        scene.rootNode.addChildNode(capsuleNode)
        // END capsule_node
        
        
        
        // Add some ambient light
        
        // BEGIN ambient_light
        let ambientLight = SCNLight()
        ambientLight.type = SCNLightTypeAmbient
        ambientLight.color = UIColor(white: 0.25, alpha: 1.0)
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = ambientLight
        
        scene.rootNode.addChildNode(ambientLightNode)
        // END ambient_light
        
        
        
        // Add an omni (point) light
        
        // BEGIN omni_light
        let omniLight = SCNLight()
        omniLight.type = SCNLightTypeOmni
        omniLight.color = UIColor(white: 1.0, alpha: 1.0)
        
        let omniLightNode = SCNNode()
        omniLightNode.light = omniLight
        omniLightNode.position = SCNVector3(x: -5, y: 8, z: 5)
        
        scene.rootNode.addChildNode(omniLightNode)
        // END omni_light
        
        // Animations are done with CAAnimations
        
        // BEGIN movement_animation
        // This animation changes the 'position' property
        let moveUpDownAnimation = CABasicAnimation(keyPath: "position")
        
        // Move 5 units on the y-axis (i.e., up)
        moveUpDownAnimation.byValue =
            NSValue(SCNVector3: SCNVector3(x: 0, y: 5, z: 0))
        // Accelerate and decelerate at the ends, instead of 
        // mechanically bouncing
        moveUpDownAnimation.timingFunction =
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        // Animation automatically moves back at the end
        moveUpDownAnimation.autoreverses = true
        
        // Animation repeats an infinite number of times (i.e., loops forever)
        moveUpDownAnimation.repeatCount = Float.infinity
        
        // The animation takes 2 seconds to run
        moveUpDownAnimation.duration = 2.0
        // END movement_animation
        
        
        // BEGIN animation_applying
        capsuleNode.addAnimation(moveUpDownAnimation, forKey: "updown")
        // END animation_applying
        
        
        // BEGIN text_node
        let text = SCNText(string: "SceneKit!", extrusionDepth: 0.2)
        
        // text will be 2 units (meters) high
        text.font = UIFont.systemFontOfSize(2)
        let textNode = SCNNode(geometry: text)
        // Positioned slightly to the left, and above the
        // capsule (which is 10 units high)
        textNode.position = SCNVector3(x: -2, y: 6, z: 0)
        
        // Add the text node to the capsule node (not the scene's root node!)
        capsuleNode.addChildNode(textNode)
        // END text_node


        
        // BEGIN text_rotation_animation
        // Rotate one full circle (2π) around the Y (up) axis
        let rotate = CABasicAnimation(keyPath: "eulerAngles")
        rotate.byValue =
            NSValue(SCNVector3: SCNVector3(x: Float(0.0),
                                           y: Float(M_PI * 2.0),
                                           z: Float(0.0)))
        
        // Do it forever
        rotate.repeatCount = Float.infinity
        
        // Take 4 seconds doing it
        rotate.duration = 4.0
        
        textNode.addAnimation(rotate, forKey: "rotation")
        // END text_rotation_animation
        
        

        // Make the capsule use a red, shiny material
        
        // BEGIN capsule_material
        let redMetallicMaterial = SCNMaterial()
        redMetallicMaterial.diffuse.contents = UIColor.redColor()
        redMetallicMaterial.specular.contents = UIColor.whiteColor()
        redMetallicMaterial.shininess = 1.0
        capsule.materials = [redMetallicMaterial]
        // END capsule_material
        
        // Load a noise texture (requires importing SpriteKit)
        
        // BEGIN texture_generate
        let noiseTexture = SKTexture(noiseWithSmoothness: 0.25,
            size: CGSize(width: 512, height: 512), grayscale: true)
        // END texture_generate
        
        // BEGIN texture_material_usage
        let noiseMaterial = SCNMaterial()
        noiseMaterial.diffuse.contents = noiseTexture
        
        text.materials = [noiseMaterial]
        // END texture_material_usage
        


        // Normal mapping
        // BEGIN normal_map_texture_gen
        let noiseNormalMapTexture =
            noiseTexture.textureByGeneratingNormalMapWithSmoothness(0.1,
                contrast: 1.0)
        // END normal_map_texture_gen
        
        // BEGIN normal_map_apply
        redMetallicMaterial.normal.contents = noiseNormalMapTexture
        // END normal_map_apply
        


        /*
        // Can also load textures as images
        let transparencyImage = UIImage(named: "Transparent")
        redMetallicMaterial.transparent.contents = transparencyImage
        */
        
        // Add a gesture recognizer
        
        // BEGIN tap_recognizer_setup
        let tapRecognizer
            = UITapGestureRecognizer(target: self, action: "tapped:")
        sceneView.addGestureRecognizer(tapRecognizer)
        sceneView.userInteractionEnabled = true
        // END tap_recognizer_setup

        
    
        // Constraints
        // BEGIN constraint_object
        let pointer = SCNPyramid(width: 0.5, height: 0.9, length: 4.0)
        let pointerNode = SCNNode(geometry: pointer)
        pointerNode.position = SCNVector3(x: -5, y: 0, z: 0)
        
        scene.rootNode.addChildNode(pointerNode)
        // END constraint_object
        
        // BEGIN constraint_adding
        let lookAtConstraint = SCNLookAtConstraint(target: capsuleNode)
        
        // When enabled, the constraint will try to rotate
        // around only a single axis
        lookAtConstraint.gimbalLockEnabled = true
        pointerNode.constraints = [lookAtConstraint]
        // END constraint_adding
        
        


        
        // Loading Collada files
        // BEGIN collada_loading
        let critterDataURL =
            NSBundle.mainBundle().URLForResource("Critter",
                withExtension: "dae")
        let critterData = SCNSceneSource(URL: critterDataURL!, options: nil)
        // END collada_loading
        
        // We can now pull data out of this file
        // Collada files contain nodes, geometries, materials, and more
        
        // BEGIN collada_adding
        // Find the node called 'Critter'; if it exists, add it
        let critterNode = critterData?.entryWithIdentifier("Critter",
            withClass: SCNNode.self) as? SCNNode
        if critterNode != nil {
            critterNode?.position = SCNVector3(x: 5, y: 0, z: 0)
            scene.rootNode.addChildNode(critterNode!)
        }
        // END collada_adding
        
        // Physics
        
        // BEGIN physics_shape
        var critterPhysicsShape : SCNPhysicsShape?
        if let geometry = critterNode?.geometry {
            critterPhysicsShape =
                SCNPhysicsShape(geometry: geometry,
                    options: nil)
        }
        // END physics_shape
        
        
        // BEGIN physics_adding
        let critterPhysicsBody =
            SCNPhysicsBody(type: SCNPhysicsBodyType.Dynamic,
                shape: critterPhysicsShape)
        critterNode?.physicsBody = critterPhysicsBody
        // END physics_adding
        
        // Floors have reflections
        // BEGIN floor
        let floor = SCNFloor()
        let floorNode = SCNNode(geometry: floor)
        floorNode.position = SCNVector3(x: 0, y: -5, z: 0)
        scene.rootNode.addChildNode(floorNode)
        
        let floorPhysicsBody =
            SCNPhysicsBody(type: SCNPhysicsBodyType.Static,
                shape: SCNPhysicsShape(geometry: floor, options: nil))
        floorNode.physicsBody = floorPhysicsBody
        // END floor

        
        // Increase / decrease physics speed
        scene.physicsWorld.speed = 2.0
        
        
        
    }
    
    
    
    // BEGIN tap_handler
    func tapped(tapRecognizer: UITapGestureRecognizer) {           
        // If a tap has happened:
        if tapRecognizer.state == UIGestureRecognizerState.Ended {
        
            // Find the object that was tapped
            let sceneView = self.view as! SCNView
            let hits = sceneView.hitTest(tapRecognizer.locationInView(
                                         tapRecognizer.view),
                                         options: nil) as! [SCNHitTestResult]
        
            // Make all selected items highlight
            for hit in hits {
            
                // Get the first material, if one exists
                if let theMaterial =
                    hit.node.geometry?.materials?[0] as? SCNMaterial {
                    // Animate from black to yellow
                    let highlightAnimation =
                        CABasicAnimation(keyPath: "contents")
                    highlightAnimation.fromValue = UIColor.blackColor()
                    highlightAnimation.toValue = UIColor.yellowColor()
                    highlightAnimation.autoreverses = true
                    highlightAnimation.repeatCount = 0
                    highlightAnimation.duration = 0.3
                    
                    // Apply this animation to the material's
                    // emission property
                    theMaterial.emission.addAnimation(
                        highlightAnimation, forKey: "highlight")
                }
                
            }
        }
    }
    // END tap_handler

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

