// This is from the course textbook (https://learning.oreilly.com/library/view/beginning-iphone-development/9781484278185/html/329781_6_En_11_Chapter.xhtml)


import SwiftUI
struct MagnificationView: View {
    @State private var tempValue: CGFloat = 0
    @State private var finalValue: CGFloat = 1
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .font(.system(size: 200))
                .foregroundColor(.green)
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
        }
    }
}
struct MagnificationView_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationView()
    }
}
