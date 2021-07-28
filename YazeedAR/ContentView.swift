//
//  ContentView.swift
//  YazeedAR
//
//  Created by Yazeed AlKhalaf on 28/07/2021.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    var body: some View {
        Text("Hello World!")
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        return arView
        
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
