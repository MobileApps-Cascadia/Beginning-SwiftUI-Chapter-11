//
//  ContentView.swift
//  Chapter11
//
//  Created by Mike Panitz on 4/18/23.
//

import SwiftUI

struct GettingStartedExerciseView: View {
    @State var rectColor = Color.gray
    @State var textColor = Color.black
    @State private var degree = 0.0
    @State private var tempValue: CGFloat = 0
    @State private var finalValue: CGFloat = 1
    @State private var rectanglePosition = CGPoint(x: 175, y: 100)
    
    var body: some View {
        VStack {
            Text("Getting started exercise goes here")
                .font(.largeTitle)
            ZStack{
                Rectangle()
                    .frame(width: 300, height: 150)
                    .foregroundColor(rectColor)

                Text("Tap to change color, hold to go \nback to grey")
                    .foregroundColor(textColor)
            }
            .onTapGesture {
                if rectColor == .black {
                    rectColor = .cyan
                    textColor = .black
                } else {
                    rectColor = .black
                    textColor = .cyan
                }
            }
            .onLongPressGesture(minimumDuration: 2, maximumDistance: 2, pressing: {stillPressed in
                //  Code to run while the long press occurs
            }) {
                //  Code to run after detecting the long press gesture
                rectColor = Color.gray
                textColor = Color.black
                degree = 0.0
            }
            .rotationEffect(Angle.degrees(degree))
            .scaleEffect(finalValue + tempValue)
            .position(rectanglePosition)
        }
        .padding()
        
        .gesture(
            MagnificationGesture()
                .onChanged { amount in
                    tempValue = amount - 1
                }
                .onEnded { amount in
                    finalValue += tempValue
                    tempValue = 0
                }
        )
        .simultaneousGesture(
            RotationGesture()
                .onChanged({ angle in
                    degree = angle.degrees
                })
        )
        .highPriorityGesture(DragGesture()
                    .onChanged({ value in
            rectanglePosition = value.location
        }))
    }
}

struct GettingStartedExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        GettingStartedExerciseView()
    }
}
