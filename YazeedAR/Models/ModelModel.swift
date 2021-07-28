//
//  ModelModel.swift
//  ModelModel
//
//  Created by Yazeed AlKhalaf on 28/07/2021.
//

import UIKit
import RealityKit
import Combine

class ModelModel {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        
        self.image = UIImage(named: modelName)!
        
        let filename = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
                print("DEBUG: unable to load model entity for model name: \(self.modelName)")
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                print("DEBUG: succcessfully loaded model entity for model name: \(self.modelName)")
            })
    }
    
    
}
