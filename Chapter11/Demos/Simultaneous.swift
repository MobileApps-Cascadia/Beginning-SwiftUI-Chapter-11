// This is from the course textbook (https://learning.oreilly.com/library/view/beginning-iphone-development/9781484278185/html/329781_6_En_11_Chapter.xhtml)

import SwiftUI

struct SimultaneousView: View {
    @State var message = ""
    var body: some View {
        VStack {
            Text(message)
                .padding()
            Circle()
                .frame(width: 125, height: 125)
                .foregroundColor(.blue)
                .onTapGesture {
                    message += "Circle tapped"
                }
            Spacer()
        }.background(Color.yellow)
            .simultaneousGesture(
                TapGesture()
                    .onEnded { _ in
                message = "VStack tapped"
            })
    }
}
struct SimultaneousView_Previews: PreviewProvider {
    static var previews: some View {
        SimultaneousView()
    }
}
