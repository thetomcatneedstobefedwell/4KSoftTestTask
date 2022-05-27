import SwiftUI

struct RightUnlockingAnimation: View {
    @State var isLoading: Bool = false
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(Color.green, lineWidth: 2)
            .frame(width: 30, height: 30)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(.linear(duration: 5).repeatForever(autoreverses: false), value: isLoading)
            .onAppear() {
                self.isLoading = true
            }
    }
}

struct RightUnlockingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        RightUnlockingAnimation()
    }
}
