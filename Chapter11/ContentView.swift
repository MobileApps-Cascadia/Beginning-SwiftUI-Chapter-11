//
//  ContentView.swift
//  Chapter11
//
//  Created by Mike Panitz on 4/18/23.
//

import SwiftUI

struct ContentView: View {
    @State var rectColor = Color.gray
    
    @State var changeMe = false
    @State var message = "Message goes here"
    
    var body: some View {
        TabView {
            TabView {
                TapAndHoldView()
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("Tap / Long Hold")
                    }
                MagnificationView()
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("Zoom")
                    }
                RotationView()
                    .tabItem {
                        Image(systemName: "3.circle")
                        Text("Spin")
                    }
                DragView()
                    .tabItem {
                        Image(systemName: "4.circle")
                        Text("Drag")
                    }
            }
            .tabItem {
                Image(systemName: "1.square")
                Text("Basics")
            }
            HighPriorityGestureView()
                .tabItem {
                    Image(systemName: "2.square")
                    Text("High Prio")
                }
            SimultaneousView()
                .tabItem {
                    Image(systemName: "3.square")
                    Text("Simultaneous")
                }
            GettingStartedExerciseView()
                .tabItem {
                    Image(systemName: "4.square")
                    Text("Getting Started")
                }
            MapExerciseView()
                .tabItem {
                    Image(systemName: "5.square")
                    Text("Map")
                }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
