//
//  ViewController.swift
//  ARKit_iniciacion
//
//  Created by estech on 22/3/23.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Comentando esta línea se oculta el eje de coordenadas y los feature points
//        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
    }
    
    
    @IBAction func dibujaCasa(_ sender: Any) {
        let node = SCNNode(geometry: SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0))
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        node.position = SCNVector3(0, 0, -1)
        self.sceneView.scene.rootNode.addChildNode(node)
        
        let nodoTejado = SCNNode(geometry: SCNPyramid(width: 0.2, height: 0.2, length: 0.2))
        nodoTejado.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        nodoTejado.position = SCNVector3(0, 0.1, 0)
        node.addChildNode(nodoTejado)
        
        let nodoPuerta = SCNNode(geometry: SCNPlane(width: 0.04, height: 0.08))
        nodoPuerta.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        nodoPuerta.position = SCNVector3(0, -0.06, 0.10001)
        node.addChildNode(nodoPuerta)
        
        let ventana1 = SCNNode(geometry: SCNPlane(width: 0.04, height: 0.04))
        ventana1.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        ventana1.position = SCNVector3(0.06, -0.008, 0.10001)
        node.addChildNode(ventana1)
        
        let ventana2 = SCNNode(geometry: SCNPlane(width: 0.04, height: 0.04))
        ventana2.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        ventana2.position = SCNVector3(-0.06, -0.008, 0.10001)
        node.addChildNode(ventana2)
        
        let nodoCesped = SCNNode(geometry: SCNPlane(width: 1.5, height: 1.5))
        nodoCesped.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "cesped")
        nodoCesped.position = SCNVector3(0.10001, -0.10001, 0)
        nodoCesped.eulerAngles = SCNVector3(-90.degreesToRadians, 0, 0)
        node.addChildNode(nodoCesped)
        
        let nodoPozo = SCNNode(geometry: SCNTube(innerRadius: 0.03, outerRadius: 0.03, height: 0.08))
        nodoPozo.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        nodoPozo.position = SCNVector3(-0.2, -0.07 , 0)
        nodoPozo.eulerAngles = SCNVector3(0, 90.degreesToRadians, 0)
        node.addChildNode(nodoPozo)
        
        let nodoPiscina = SCNNode(geometry: SCNPlane(width: 0.3, height: 0.6))
        nodoPiscina.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "agua")
        nodoPiscina.position = SCNVector3(0.5, -0.1, 0)
        nodoPiscina.eulerAngles = SCNVector3(-90.degreesToRadians, 0, 0)
        node.addChildNode(nodoPiscina)
        
        let nodoFlotador = SCNNode(geometry: SCNTorus(ringRadius: 0.03, pipeRadius: 0.01))
        nodoFlotador.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        nodoFlotador.position = SCNVector3(0, -0.10001, 0)
        nodoFlotador.eulerAngles = SCNVector3(-90.degreesToRadians, 0, 0)
        nodoPiscina.addChildNode(nodoFlotador)
        
        let arbol1 = SCNNode(geometry: SCNCylinder(radius: 0.03, height: 0.3))
        arbol1.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        arbol1.position = SCNVector3(0.2, 0, 0.15)
        arbol1.eulerAngles = SCNVector3(90.degreesToRadians, 0, 0)
        nodoPiscina.addChildNode(arbol1)
        let esfera = SCNSphere(radius: 0.1)
        let topNode = SCNNode(geometry: esfera)
        topNode.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        topNode.position = SCNVector3(0, 0.1, 0)
        arbol1.addChildNode(topNode)
        
        let arbol2 = SCNNode(geometry: SCNCylinder(radius: 0.03, height: 0.3))
        arbol2.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        arbol2.position = SCNVector3(-0.2, 0, 0.15)
        arbol2.eulerAngles = SCNVector3(90.degreesToRadians, 0, 0)
        nodoPiscina.addChildNode(arbol2)
        let piramide = SCNPyramid(width: 0.2, height: 0.2, length: 0.2)
        let topNode2 = SCNNode(geometry: piramide)
        topNode2.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        topNode2.position = SCNVector3(0, 0.01, 0)
        arbol2.addChildNode(topNode2)

    }
    
    
    @IBAction func resetAction(_ sender: Any) {
        self.resetSession()
    }
    
    func resetSession() {
        self.sceneView.session.pause()
        //Eliminar nodos
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        //Volver a ejecutar la sesión
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }


}


extension Int {
    var degreesToRadians: Float { return Float(self) * .pi/180 }
}
