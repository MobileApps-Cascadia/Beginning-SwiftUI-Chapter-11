// This is from the course textbook (https://learning.oreilly.com/library/view/beginning-iphone-development/9781484278185/html/329781_6_En_11_Chapter.xhtml)

import SwiftUI
struct DragView: View {
    @State private var circlePosition = CGPoint(x: 50, y: 50)
    @State private var circleLabel = "50, 50"
    var body: some View {
        VStack {
            Text(circleLabel)
                .padding()
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .opacity(0.8)
                .position(circlePosition)
                .gesture(DragGesture()
                            .onChanged({ value in
                    circlePosition = value.location
                    circleLabel = "\(Int(value.location.x)), \(Int(value.location.y))"
                }))
        }
    }
}
struct DragViewView_Previews: PreviewProvider {
    static var previews: some View {
        DragView()
    }
}
