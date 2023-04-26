// This is from the course textbook (https://learning.oreilly.com/library/view/beginning-iphone-development/9781484278185/html/329781_6_En_11_Chapter.xhtml)

import SwiftUI
struct RotationView: View {
    @State private var degree = 0.0
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .font(.system(size: 200))
                .foregroundColor(.green)
                .rotationEffect(Angle.degrees(degree))
                .gesture(
                    RotationGesture()
                        .onChanged({ angle in
                            degree = angle.degrees
                        })
                )
        }
    }
}
struct RotationView_Previews: PreviewProvider {
    static var previews: some View {
        RotationView()
    }
}
