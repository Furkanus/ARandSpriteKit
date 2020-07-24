//
//  ViewController.swift
//  ARandSpriteKIT
//
//   Created by Furkan Hanci on 7/15/20.
//

import UIKit
import SpriteKit
import ARKit

class ViewController: UIViewController, ARSKViewDelegate {
    
    @IBOutlet var sceneView: ARSKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and node count
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        let scene = Scene(size: sceneView.bounds.size)
        scene.scaleMode = .resizeFill
        sceneView.presentScene(scene)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
        let configuration = ARWorldTrackingConfiguration()
        //configuration.planeDetection = .horizontal
        
      
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
       
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    func randomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
   
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        let ghostId = randomInt(min: 1, max: 6)
        
        let node = SKSpriteNode(imageNamed: "ghost\(ghostId)")
        node.name = "ghost"
        
        return node
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
       
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        
        
    }
}
