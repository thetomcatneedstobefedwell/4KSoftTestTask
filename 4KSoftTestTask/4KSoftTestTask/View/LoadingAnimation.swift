import SwiftUI

struct LoadingAnimation: View {
    var isLoading: Bool
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(LinearGradient(gradient: Gradient(colors: [Color(red: 0, green: 0.267, blue: 0.545), Color(red: 0, green: 0.561, blue: 0.827)]), startPoint: .leading, endPoint: .trailing), lineWidth: 8)
            .frame(width: 150, height: 150)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(.linear(duration: 5).repeatForever(autoreverses: false), value: isLoading)
            .overlay(
                Text("Loading...")
                    .bold()
                    .font(.system(.body, design: .rounded))
            )
    }
}

struct LoadingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LoadingAnimation(isLoading: true)
    }
}
