import SwiftUI

struct Header: View {
    var body: some View {
        HStack(spacing: 200) {
            HStack(spacing: 3) {
                Text("Inter")
                    .foregroundColor(Color(red: 0.655, green: 0.659, blue: 0.667))
                Text("QR")
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color(red: 0, green: 0.267, blue: 0.545), Color(red: 0, green: 0.561, blue: 0.827)]), startPoint: .leading, endPoint: .trailing))
            }
            .font(.system(size: 25, weight: .bold, design: .rounded))
            
            Image("gear")
        }
        .padding(.top)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
