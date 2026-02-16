import SwiftUI

struct MainView: View {
    @State private var showChat = false
    @State private var selectedGender = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Friends Anonymous")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Select your gender to start chatting")
                    .foregroundColor(.secondary)
                    .padding(.bottom, 40)
                
                Button(action: { startChat(gender: "male") }) {
                    Text("MALE")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                
                Button(action: { startChat(gender: "female") }) {
                    Text("FEMALE")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                
                Button(action: { startChat(gender: "any") }) {
                    Text("ANYONE / OTHER")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1))
                        .foregroundColor(.primary)
                }
                
                NavigationLink(destination: GamesView()) {
                    Text("EXPLORE GAMES")
                        .foregroundColor(.purple)
                        .padding(.top, 20)
                }
                
                NavigationLink(destination: CategoriesView()) {
                    Text("BROWSE CATEGORIES")
                        .foregroundColor(.teal)
                }
                
                Spacer()
                
                Text("🔒 Screen Capture Protection Active")
                    .font(.caption)
                    .foregroundColor(.green)
                
                Text("By continuing, you agree to stay anonymous and respect others. Blackmail and fraud will lead to a permanent ban.")
                    .font(.caption2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .padding(24)
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $showChat) {
                ChatView(gender: selectedGender)
            }
        }
    }
    
    func startChat(gender: String) {
        self.selectedGender = gender
        self.showChat = true
    }
}
