import SwiftUI

struct WelcomePart: View {
    var body: some View {
        HStack() {
            Text("Welcome")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
            
            Image("home")
                .offset(x: 25, y: 10)
        }
        .padding(.bottom, 40)
    }
}

struct WelcomePart_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePart()
    }
}
