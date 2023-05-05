//
//  ContentView.swift
//  Chapter11
//
//  Created by Mike Panitz on 4/18/23.
//

import SwiftUI

struct GettingStartedExerciseView: View {
    
    @State private var rectangleColor = Color.blue
    @State private var rotationAngle: Angle = .degrees(0)
    @State private var scale: CGFloat = 1.0
    @State private var dragOffset: CGSize = .zero
    @State private var resetColor = false
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { gesture in
                dragOffset = gesture.translation
                resetColor = true
            }
            .onEnded { _ in
                dragOffset = .zero
                resetColor = false
            }
        
        let longPressGesture = LongPressGesture(minimumDuration: 2.0)
            .onEnded { _ in
                rectangleColor = .blue
            }
        
        let rotationGesture = RotationGesture()
            .onChanged { gesture in
                rotationAngle = gesture.degreesToRadians
                resetColor = true
            }
            .onEnded { _ in
                rotationAngle = .degrees(0)
                resetColor = false
            }
        
        let magnificationGesture = MagnificationGesture()
            .onChanged { gesture in
                scale = gesture.magnitude
                resetColor = true
            }
            .onEnded { _ in
                scale = 1.0
                resetColor = false
            }
        
        let tapGesture = TapGesture()
            .onEnded { _ in
                rectangleColor = Color(red: Double.random(in: 0...1),
                                       green: Double.random(in: 0...1),
                                       blue: Double.random(in: 0...1))
            }
        
        let gesture = longPressGesture
            .sequenced(before: dragGesture)
            .exclusively(before: rotationGesture)
            .exclusively(before: magnificationGesture)
            .simultaneously(with: tapGesture)
        
        let rectangle = Rectangle()
            .fill(rectangleColor)
            .overlay(Text("Hello, world!")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.7)))
            .frame(width: 200, height: 100)
            .rotationEffect(rotationAngle)
            .scaleEffect(scale)
            .offset(x: dragOffset.width, y: dragOffset.height)
            .gesture(gesture)
        
        return rectangle
            .padding()
    }
}

private extension Angle {
    var degreesToRadians: Angle {
        return self * .pi / 180
    }
}

struct GettingStartedExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        GettingStartedExerciseView()
    }
}
