//
//  ModelPickerView.swift
//  ModelPickerView
//
//  Created by Yazeed AlKhalaf on 28/07/2021.
//

import SwiftUI

struct ModelPickerWidget: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: String?
    
    let models: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(0 ..< self.models.count) { index in
                    Button(action: {
                        print("DEBUG: selected model with name: \(self.models[index])")
                        
                        self.isPlacementEnabled = true
                        self.selectedModel = self.models[index]
                    }) {
                        Image(self.models[index])
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
