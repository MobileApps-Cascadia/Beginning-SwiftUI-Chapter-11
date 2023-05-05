//
//  ContentView.swift
//  Chapter11
//
//  Created by Mike Panitz on 4/18/23.
//

import SwiftUI
import MapKit

struct MapExerciseView: View {
    
    @State var tempValue: CGFloat = 0
    @State var finalValue: CGFloat = 1
    @State var degree = 0.0
    @State var message = ""
    @State var imageOne: String = "imageOne"
    @State var imageTwo: String = "imageTwo"
    @State var imageTwoPosition: CGPoint = CGPoint(x: 50, y: 50)
    
    

    var body: some View {

        VStack {
            Image("Map")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .scaleEffect(finalValue + tempValue)
                .simultaneousGesture(
                    MagnificationGesture()
                        .onChanged{amount in tempValue = amount - 1}
                        .onEnded{amount in finalValue += tempValue
                            tempValue = 0}
                )
                .rotationEffect(Angle.degrees(degree))
                .simultaneousGesture(
                    RotationGesture()
                        .onChanged({
                            angle in degree = angle.degrees
                        })
                )
                .onLongPressGesture(minimumDuration: 2, maximumDistance: 2, pressing:{
                    stillPressed in message = "Inserting map pin"
                }){
                    print(message)
                    // can not figure out how to get value to be in scope to change pin location
                }
                .overlay(
                        Image("custom.mappin")
                            .position(imageTwoPosition)
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
