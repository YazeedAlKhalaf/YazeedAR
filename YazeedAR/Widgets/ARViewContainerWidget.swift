//
//  ARViewContainerWidget.swift
//  ARViewContainerWidget
//
//  Created by Yazeed AlKhalaf on 28/07/2021.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct ARViewContainerWidget: UIViewRepresentable {
    @Binding var modelConfirmedForPlacement: ModelModel?
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = FocusARView(frame: .zero)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let model = self.modelConfirmedForPlacement {
            
            if let modelEntity = model.modelEntity {
                print("DEBUG: adding model to scene - \(model.modelName)")
                
                let anchorEntity = AnchorEntity(plane: .any)
                anchorEntity.addChild(modelEntity.clone(recursive: true))
                
                uiView.scene.addAnchor(anchorEntity)
            } else {
                print("DEBUG: unable to load model entity for \(model.modelName)")
            }
            
            
            DispatchQueue.main.async {
                self.modelConfirmedForPlacement = nil
            }
        }
    }
    
}


class FocusARView: ARView {
    var focusEntity: FocusEntity?
    
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        self.setupConfig()
        
        self.focusEntity = FocusEntity(on: self, focus: .classic)
    }
    
    func setupConfig() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
        self.session.run(config)
    }
    
    @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FocusARView: FocusEntityDelegate {
    func toTrackingState() {
        print("DEBUG: tracking")
    }
    
    func toInitializingState() {
        print("DEBUG: initializing")
    }
}
