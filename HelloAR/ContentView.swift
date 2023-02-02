//
//  ContentView.swift
//  HelloAR
//
//  Created by Davide Aliti on 18/01/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap)))
        
        context.coordinator.view = arView
        
//        let anchor = AnchorEntity(plane: .horizontal)
//        
//        let material = SimpleMaterial(color: .blue, isMetallic: true)
//        let box = ModelEntity(mesh: MeshResource.generateBox(size: 0.3), materials: [material])
//        box.generateCollisionShapes(recursive: true)
//        
//        let sphereMaterial = SimpleMaterial(color: .yellow, isMetallic: true)
//        let sphere = ModelEntity(mesh: MeshResource.generateSphere(radius: 0.3), materials: [sphereMaterial])
//        sphere.position = simd_make_float3(0, 0.4, 0)
//        sphere.generateCollisionShapes(recursive: true)
//        
//        let planeMaterial = SimpleMaterial(color: .red, isMetallic: true)
//        let plane = ModelEntity(mesh: MeshResource.generatePlane(width: 0.5, depth: 0.3), materials: [planeMaterial])
//        plane.position = simd_make_float3(0, 0.7, 0)
//        plane.generateCollisionShapes(recursive: true)
//        
//        let textMaterial = SimpleMaterial(color: .blue, isMetallic: true)
//        let text = ModelEntity(mesh: MeshResource.generateText("Hello AR", extrusionDepth: 0.03, font: .systemFont(ofSize: 0.2), containerFrame: .zero, alignment: .center, lineBreakMode: .byCharWrapping), materials: [textMaterial])
//        text.position = simd_make_float3(0, 0.8, 0)
//        text.generateCollisionShapes(recursive: true)
//        
//        anchor.addChild(box)
//        anchor.addChild(sphere)
//        anchor.addChild(plane)
//        anchor.addChild(text)
//        arView.scene.anchors.append(anchor)
        
        return arView
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
