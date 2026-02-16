import SwiftUI

struct CallView: View {
    let callType: String
    @Environment(\.presentationMode) var presentationMode
    @State private var isMicMuted = false
    @State private var isVideoOff = false
    @State private var selectedFilter = "Original"
    
    let filters = ["Original", "✨ Beauty", "🤡 Funny", "🐶 Dog", "👽 Alien", "🐿️ Chipmunk"]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(callType == "Voice" ? "Voice Call" : "Video Call")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top)
                
                Text("🔒 End-to-End Secure")
                    .font(.caption)
                    .foregroundColor(.green)
                
                Spacer()
                
                if callType != "Voice" && !isVideoOff {
                    Rectangle()
                        .fill(Color.darkGray)
                        .overlay(Text("Partner Video").foregroundColor(.white))
                } else {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 120, height: 120)
                        .overlay(Image(systemName: "person.fill").resizable().padding(30).foregroundColor(.white))
                }
                
                Spacer()
                
                // Filter Selector
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(filters, id: \.self) { filter in
                            Button(action: { selectedFilter = filter }) {
                                Text(filter)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(selectedFilter == filter ? Color.purple : Color.gray.opacity(0.3))
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding()
                }
                
                // Controls
                HStack(spacing: 40) {
                    Button(action: { isMicMuted.toggle() }) {
                        Image(systemName: isMicMuted ? "mic.slash.fill" : "mic.fill")
                            .font(.title)
                            .padding()
                            .background(isMicMuted ? Color.red : Color.gray.opacity(0.3))
                            .clipShape(Circle())
                    }
                    
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "phone.down.fill")
                            .font(.title)
                            .padding(25)
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                    
                    Button(action: { isVideoOff.toggle() }) {
                        Image(systemName: isVideoOff ? "video.slash.fill" : "video.fill")
                            .font(.title)
                            .padding()
                            .background(isVideoOff ? Color.red : Color.gray.opacity(0.3))
                            .clipShape(Circle())
                    }
                }
                .foregroundColor(.white)
                .padding(.bottom, 50)
            }
        }
    }
}

extension Color {
    static let darkGray = Color(white: 0.2)
}
