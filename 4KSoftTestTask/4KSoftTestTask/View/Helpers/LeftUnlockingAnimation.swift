import SwiftUI

struct LeftUnlockingAnimation: View {
    @State private var isLoading = false
    
    var body: some View {
        Circle()
            .foregroundColor(Color(red: 0.842, green: 0.842, blue: 0.842))
            .frame(width: 41, height: 41)
            .overlay(
                HStack(spacing: 5) {
                    ForEach(0..<3, id: \.self) { circle in
                        Circle()
                            .frame(width: 4, height: 4)
                            .foregroundColor(.white)
                            .scaleEffect(isLoading ? 0 : 1)
                            .animation(.linear(duration: 0.6).repeatForever().delay(0.2 * Double(circle)), value: isLoading)
                    }
                }
            )
            .onAppear() {
                self.isLoading = true
            }
    }
}

struct LeftUnlockingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LeftUnlockingAnimation()
    }
}
