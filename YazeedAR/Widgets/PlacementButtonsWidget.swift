//
//  PlacementButtonsWidget.swift
//  PlacementButtonsWidget
//
//  Created by Yazeed AlKhalaf on 28/07/2021.
//

import SwiftUI

struct PlacementButtonsWidget: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: ModelModel?
    @Binding var modelConfirmedForPlacement: ModelModel?
    
    func resetPlacementParameters() {
        self.isPlacementEnabled = false
        self.selectedModel = nil
    }
    
    var body: some View {
        HStack {
            Button(action: {
                print("DEBUG: cancel model placement")
                
                self.resetPlacementParameters()
            }) {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
            
            Button(action: {
                print("DEBUG: confirm model placement")
                
                self.modelConfirmedForPlacement = self.selectedModel
                self.resetPlacementParameters()
            }) {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
        }
    }
}
