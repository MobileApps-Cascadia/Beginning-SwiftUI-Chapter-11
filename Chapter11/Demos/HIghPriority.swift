// This is from the course textbook (https://learning.oreilly.com/library/view/beginning-iphone-development/9781484278185/html/329781_6_En_11_Chapter.xhtml)
import SwiftUI

struct HighPriorityGestureView: View {
    @State var message = ""
    var body: some View {
        HStack {
            VStack {
                Text("WITHOUT High Priority")
                    .font(.system(size: 30))
                Text(message)
                    .padding()
                Circle()
                    .frame(width: 125, height: 125)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        message = "Circle tapped"
                    }
                Spacer()
            }.background(Color.yellow)
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            message = "VStack tapped"
                        })

            VStack {
                Text("WITH\n High Priority")
                    .font(.system(size: 30))
                Text(message)
                    .padding()
                Circle()
                    .frame(width: 125, height: 125)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        message = "Circle tapped"
                    }
                Spacer()
            }.background(Color.yellow)
                .highPriorityGesture(
                    TapGesture()
                        .onEnded { _ in
                            message = "VStack tapped"
                        })
        }
    }
}
struct HighPriorityGestureView_Previews: PreviewProvider {
    static var previews: some View {
        HighPriorityGestureView()
    }
}
