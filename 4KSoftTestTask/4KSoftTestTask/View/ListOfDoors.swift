import SwiftUI

struct ListOfDoors: View {
    @StateObject var doors: Doors = Doors()
    
    var body: some View {
        VStack {
            HStack {
                Text("My doors")
                    .font(.system(size: 20))
                    .bold()
                
                Spacer()
            }
            .padding(.horizontal, 30)
            
            ForEach(0..<doors.doors.count, id: \.self) { index in
                    Button {
                        self.doors.doors[index].status = .unlocking
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            self.doors.doors[index].status = .unlocked
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                self.doors.doors[index].status = .locked
                            }
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 0.89, green: 0.918, blue: 0.918))
                            .overlay(
                                VStack(spacing: 30) {
                                    HStack {
                                        self.doors.doors[index].leftImage
                                        
                                        VStack(alignment: .leading) {
                                            Text(self.doors.doors[index].title)
                                                .bold()
                                                .foregroundColor(.primary)
                                            Text(self.doors.doors[index].location)
                                                .foregroundColor(.secondary)
                                        }
                                        
                                        Spacer()
                                        
                                        self.doors.doors[index].rightImage
                                    }
                                    
                                    Text(self.doors.doors[index].status.rawValue)
                                        .bold()
                                        .foregroundColor(self.doors.doors[index].status == .unlocking ? .gray : Color(red: 0, green: 0.267, blue: 0.545))
                                        .opacity(self.doors.doors[index].status == .locked ? 1 : 0.5)
                                }
                                    .padding()
                            )
                            .frame(height: 120)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                    }
                }
        }
        .font(.system(.body, design: .rounded))
    }
}

struct ListOfDoors_Previews: PreviewProvider {
    static var previews: some View {
        ListOfDoors()
    }
}
