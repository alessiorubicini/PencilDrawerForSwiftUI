//
//  DrawingCanvasView.swift
//
//
//  Created by Alessio Rubicini on 27/10/23.
//

import Foundation
import SwiftUI
import PencilKit

struct DrawingCanvasView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = DrawingCanvasViewController
    
    @Binding var drawingData: Data
    var drawingPolicy: PKCanvasViewDrawingPolicy
    var drawingChanged: (Data) -> Void
    
    func makeUIViewController(context: Context) -> DrawingCanvasViewController {
        let viewController = DrawingCanvasViewController(drawingPolicy: self.drawingPolicy)
        viewController.drawingData = drawingData
        viewController.drawingChanged = drawingChanged
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: DrawingCanvasViewController, context: Context) {
        // Update the view controller if needed
        
    }
    
}
