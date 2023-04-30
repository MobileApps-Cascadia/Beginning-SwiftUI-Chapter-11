//
//  ContentView.swift
//  Chapter11
//
//  Created by Mike Panitz on 4/18/23.
//

import SwiftUI

struct TapAndHoldView: View {
    @State var rectColor = Color.gray
    
    @State var changeMe = false
    @State var message = "Message goes here"
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                Rectangle()
                    .frame(width: 175, height: 125)
                    .foregroundColor(rectColor)
                    .onTapGesture {
                        if rectColor == .red {
                            rectColor = .blue
                        } else {
                            rectColor = .red
                        }
                    }
                    .onLongPressGesture(minimumDuration: 2, maximumDistance: 2, pressing: {stillPressed in
                        //  Code to run while the long press occurs
                    }) {
                        //  Code to run after detecting the long press gesture
                    }
            }
            VStack {
                Text(message)
                Rectangle()
                    .frame(width: 175, height: 125)
                    .foregroundColor(changeMe ? .red : .yellow)
                    .onLongPressGesture(minimumDuration: 2, maximumDistance: 2, pressing: {stillPressed in
                        message = "Long press in progress: \(stillPressed)"
                    }) {
                        changeMe.toggle()
                    }
                
            }
        }
        .padding()
    }
}

struct TapAndHoldView_Previews: PreviewProvider {
    static var previews: some View {
        TapAndHoldView()
    }
}
