//
//  ContentView.swift
//  Chapter11
//
//  Created by Mike Panitz on 4/18/23.
//

import SwiftUI

struct GettingStartedExerciseView: View {

    @State var rectangleColor = Color.blue
    @State var message = ""
    @State var degree = 0.0
    @State var tempValue : CGFloat = 0
    @State var finalValue: CGFloat = 1
    @State var circlePosition = CGPoint (x: 200, y: 300)
    @State var circleLabel = "200,300"
    var body: some View {
        
        VStack {
            Text(circleLabel)
                .padding()
            Text("Rectangle")
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .padding()
                .frame(width: 200, height: 200)
                .background(Rectangle().fill(rectangleColor))
                .onTapGesture {
                    rectangleColor = generateRandomColor()
                }
                .onLongPressGesture(minimumDuration: 2, maximumDistance: 2, pressing:{
                    stillPressed in message = "Resetting color to blue"
                }){
                    print(message)
                    rectangleColor = Color.blue
                }
                .rotationEffect(Angle.degrees(degree))
                .simultaneousGesture(
                    RotationGesture()
                        .onChanged({
                            angle in degree = angle.degrees
                        })
                )
                .scaleEffect(finalValue + tempValue)
                .simultaneousGesture(
                    MagnificationGesture()
                        .onChanged{amount in tempValue = amount - 1}
                        .onEnded{amount in finalValue += tempValue
                            tempValue = 0}
                )
                .position(circlePosition)
                .highPriorityGesture(
                    DragGesture()
                    .onChanged({
                        value in circlePosition = value.location
                        circleLabel = "\(Int(value.location.x)), \(Int(value.location.y))"
                    })
                )
            
            /*Rectangle()
                .frame(width: 200, height: 200)
                .foregroundColor(rectangleColor)
                .onTapGesture {
                    rectangleColor = generateRandomColor()*/
        }
        .padding()
    }
    func generateRandomColor() -> Color{
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        
        let randomColor = Color(red: redValue, green: greenValue, blue: blueValue)
        
        return randomColor
    }
}

struct GettingStartedExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        GettingStartedExerciseView()
    }
}
