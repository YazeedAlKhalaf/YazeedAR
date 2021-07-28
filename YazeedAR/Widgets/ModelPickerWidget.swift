//
//  ModelPickerView.swift
//  ModelPickerView
//
//  Created by Yazeed AlKhalaf on 28/07/2021.
//

import SwiftUI

struct ModelPickerWidget: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: ModelModel?
    
    let models: [ModelModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(0 ..< self.models.count) { index in
                    Button(action: {
                        print("DEBUG: selected model with name: \(self.models[index].modelName)")
                        
                        self.isPlacementEnabled = true
                        self.selectedModel = self.models[index]
                    }) {
                        Image(uiImage: self.models[index].image)
                            .resizable()
                            .frame(height: 80)
                            .aspectRatio(1 / 1, contentMode: .fit)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(20)
        .background(Color.black.opacity(0.5))
    }
}
