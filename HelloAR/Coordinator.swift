//
//  Coordinator.swift
//  HelloAR
//
//  Created by Davide Aliti on 24/01/23.
//

import Foundation
import ARKit
import RealityKit
import Combine

class Coordinator: NSObject {
    
    weak var view: ARView?
    var cancellable: AnyCancellable?
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        guard let view = self.view else { return }
        
        guard view.scene.anchors.first(where: { $0.name == "LunarRoverAnchor"} ) == nil else { return }
        
        let tapLocation = recognizer.location(in: view)
        
//        if let entity = view.entity(at: tapLocation) as? ModelEntity {
//            let material = SimpleMaterial(color: UIColor.random(), isMetallic: true)
//            entity.model?.materials = [material]
        
        let results = view.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal)
        
        if let result = results.first {
            let anchorEntity = AnchorEntity(raycastResult: result)
            
//            cancellable = ModelEntity.loadAsync(named: "fender_stratocaster")
//                .append(ModelEntity.loadAsync(named: "toy_car"))
//                .collect()
//                .sink { loadCompletion in
//                    if case .failure(_) = loadCompletion {
//                        print("Unable to load")
//                    }
//                    self.cancellable?.cancel()
//                } receiveValue: { entities in
//                    var x: Float = 0.0
//                    entities.forEach { entity in
//                        entity.position = simd_make_float3(x, 0, 0)
//                        anchorEntity.addChild(entity)
//                        x += 0.3
//                    }
//                }

            cancellable = ModelEntity.loadAsync(named: "LunarRover")
                .sink { loadCompletion in
                    if case .failure(_) = loadCompletion {
                        print("Unable to load")
                    }
                    self.cancellable?.cancel()
                } receiveValue: { entity in
                    anchorEntity.name = "LunarRoverAnchor"
                    anchorEntity.addChild(entity)
                }

            view.scene.addAnchor(anchorEntity)
        }
    }
}
