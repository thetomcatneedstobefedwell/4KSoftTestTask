import SwiftUI

struct ContentView: View {
    @State private var showLoadingAnimation: Bool = true
    @State private var isLoading: Bool = false
    
    var body: some View {
        ZStack {
            if showLoadingAnimation {
                LoadingAnimation(isLoading: isLoading)
                    .onAppear() {
                        self.isLoading = true
                    }
            } else {
                ScrollView {
                    VStack {
                        Header()
                        
                        WelcomePart()
                        
                        ListOfDoors()
                    }
                }
            }
        }
        .onAppear() {
            startProcessing()
        }
    }
    
    private func startProcessing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showLoadingAnimation = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
