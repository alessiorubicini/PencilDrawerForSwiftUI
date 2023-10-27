//
//  DrawingCanvasView.swift
//
//
//  Created by Alessio Rubicini on 27/10/23.
//

import Foundation
import SwiftUI
import PencilKit


/// A SwiftUI view that represents a PencilKit drawing canvas within your application.
public struct DrawingView: UIViewControllerRepresentable {
    
    public typealias UIViewControllerType = DrawingCanvasViewController
    
    @Binding var drawingData: Data
    var drawingPolicy: PKCanvasViewDrawingPolicy
    var drawingChanged: (Data) -> Void
    
    /// Initializes a `DrawingView` with the specified parameters
    /// - Parameters:
    ///   - drawingData: A binding to the drawing data, which represents the current state of the drawing canvas.
    ///   - drawingPolicy: he drawing policy that specifies the allowed input on the canvas.
    ///   - drawingChanged: A closure that is called when the drawing content changes, providing the updated drawing data.
    public init(drawingData: Binding<Data>, drawingPolicy: PKCanvasViewDrawingPolicy = .default, drawingChanged: @escaping (Data) -> Void) {
        
        self._drawingData = drawingData
        self.drawingPolicy = drawingPolicy
        self.drawingChanged = drawingChanged
    }
    
    public func makeUIViewController(context: Context) -> DrawingCanvasViewController {
        let viewController = DrawingCanvasViewController(drawingPolicy: self.drawingPolicy)
        viewController.drawingData = drawingData
        viewController.drawingChanged = drawingChanged
        return viewController
    }
    
    public func updateUIViewController(_ uiViewController: DrawingCanvasViewController, context: Context) {
        // Update the view controller if needed
        
    }
    
}
