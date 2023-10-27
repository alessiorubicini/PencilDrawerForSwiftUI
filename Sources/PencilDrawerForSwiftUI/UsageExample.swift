//
//  UsageExample.swift
//
//
//  Created by Alessio Rubicini on 27/10/23.
//

import SwiftUI

struct UsageExample: View {
    
    @State private var drawing: Data = Data()
    
    var body: some View {
        DrawingView(drawingData: $drawing, drawingPolicy: .anyInput, drawingChanged: { updatedData in
            // Handle changes in the drawing
            
        })
    }
    
}

#Preview {
    UsageExample()
}
