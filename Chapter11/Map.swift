//
//  ContentView.swift
//  Chapter11
//
//  Created by Mike Panitz on 4/18/23.
//
// Map: I digitized this map for a friend for his DnD world using Inkarnate and a photo of a 30 year old drawing. I got permission from him to use the image for this assignment
// Compass: https://all-free-download.com/free-vector/download/compass_312235.html

import SwiftUI

struct MapExerciseView: View {

    @State private var tempValue: CGFloat = 0
    @State private var finalValue: CGFloat = 1
    
    @State private var mapPosition = CGPoint(x: 50, y: 50)
    
    @State private var degree = 0.0
    
    var body: some View {
        VStack {
            ZStack{
                Image("Jeff_Map")
                    .scaleEffect(finalValue + tempValue)
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
                    .position(mapPosition)
                    .simultaneousGesture(DragGesture()
                        .onChanged({ value in
                            mapPosition = value.location
                        }))
                    .rotationEffect(Angle.degrees(degree))
                Image("compass")
                    .resizable()
                    .frame(width:100, height:100)
                    .rotationEffect(Angle.degrees(degree))
                    .position(x:50, y:50)
            }
            .simultaneousGesture(
                RotationGesture()
                    .onChanged({ angle in
                        degree = angle.degrees
                    })
            )
        }
        .padding()
    }
}

struct MapExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        MapExerciseView()
    }
}
