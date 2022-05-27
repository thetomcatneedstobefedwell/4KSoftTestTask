import Foundation
import SwiftUI

class Doors: ObservableObject {
    @Published var doors: [Door] = [Door(title: "Front door", location: "Home"), Door(title: "Back door", location: "Office"), Door(title: "Kitchen door", location: "Home")]
}

struct Door {
    var title: String
    var location: String
    var status: DoorStatus = .locked
    
    init(title: String, location: String) {
        self.title = title
        self.location = location
    }
    
    var leftImage: some View {
        var image: AnyView
        
        switch status {
        case .locked:
            image = AnyView(Image("shieldLocked"))
        case .unlocked:
            image = AnyView(Image("shieldUnlocked"))
        case .unlocking:
            image = AnyView(LeftUnlockingAnimation())
        }
                            
        return image.shadow(radius: 1)
    }
    
    var rightImage: some View {
        switch status {
        case .locked:
            return AnyView(Image("lockedDoor"))
        case .unlocked:
            return AnyView(Image("unlockedDoor"))
        case .unlocking:
            return AnyView(RightUnlockingAnimation())
        }
    }
}

enum DoorStatus: String {
    case locked = "Locked"
    case unlocked = "Unlocked"
    case unlocking = "Unlocking..."
}
