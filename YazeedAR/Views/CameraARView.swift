//
//  ContentView.swift
//  YazeedAR
//
//  Created by Yazeed AlKhalaf on 28/07/2021.
//

import SwiftUI

struct CameraARView : View {
    @State private var isPlacementEnabled = false
    @State private var selectedModel: ModelModel?
    @State private var modelConfirmedForPlacement: ModelModel?
    
    private var models: [ModelModel] = {
        let fileManager = FileManager.default
        
        guard let path = Bundle.main.resourcePath,
              let files = try? fileManager.contentsOfDirectory(atPath: path)
        else {
            return []
        }
        
        var availableModels: [ModelModel] = [];
        for filename in files where filename.hasSuffix("usdz") {
            let modelName = filename.replacingOccurrences(of: ".usdz", with: "")
            
            let modelModel = ModelModel(modelName: modelName)
            
            availableModels.append(modelModel)
        }
        
        return availableModels
    }()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainerWidget(modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
            if self.isPlacementEnabled {
                PlacementButtonsWidget(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel, modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
            } else {
                ModelPickerWidget(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel, models: self.models)
            }
        }
    }
}

#if DEBUG
struct CameraARView_Previews : PreviewProvider {
    static var previews: some View {
        CameraARView()
    }
}
#endif
