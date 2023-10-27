//
//  DrawingCanvasViewController.swift
//
//
//  Created by Alessio Rubicini on 27/10/23.
//

import Foundation
import SwiftUI

import PencilKit

class DrawingCanvasViewController: UIViewController {
    
    var drawingData = Data()
    var drawingChanged: (Data) -> Void = {_ in}
    
    init(drawingPolicy: PKCanvasViewDrawingPolicy) {
        super.init(nibName: nil, bundle: nil)
        canvas.drawingPolicy = drawingPolicy
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    lazy var canvas: PKCanvasView = {
        let view = PKCanvasView()
        //view.drawingPolicy = .anyInput
        view.minimumZoomScale = 1
        view.maximumZoomScale = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var toolPicker: PKToolPicker = {
        let toolPicker = PKToolPicker()
        toolPicker.addObserver(self)
        return toolPicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvas)
        NSLayoutConstraint.activate([
            canvas.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            canvas.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            canvas.topAnchor.constraint(equalTo: view.topAnchor),
            canvas.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        )
        
        toolPicker.setVisible(true, forFirstResponder: canvas)
        toolPicker.addObserver(canvas)
        canvas.delegate = self
        canvas.becomeFirstResponder()
        
        if let drawing = try? PKDrawing(data: drawingData){
            canvas.drawing = drawing
        }
        
    }
}

extension DrawingCanvasViewController: PKToolPickerObserver, PKCanvasViewDelegate {
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        self.drawingChanged(canvasView.drawing.dataRepresentation())
    }
}
