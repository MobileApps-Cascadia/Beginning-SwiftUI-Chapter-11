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

                    
            }.onTapGesture {
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
            }
        }
        .padding()
    }
}

struct GettingStartedExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        GettingStartedExerciseView()
    }
}
