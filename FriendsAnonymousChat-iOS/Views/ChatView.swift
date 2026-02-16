import SwiftUI

struct ChatView: View {
    let gender: String
    @Environment(\.presentationMode) var presentationMode
    @State private var messageText = ""
    @State private var messages: [ChatMessage] = []
    @State private var isMatching = true
    @State private var showCall = false
    @State private var callType = "Voice"
    
    var body: some View {
        VStack {
            // Toolbar
            HStack {
                Text(isMatching ? "Searching..." : "Connected (Anonymous)")
                    .fontWeight(.bold)
                Spacer()
                
                if !isMatching {
                    Button(action: { initiateCall(type: "Voice") }) {
                        Image(systemName: "phone.fill")
                            .foregroundColor(.green)
                    }
                    .padding(.trailing, 10)
                    
                    Button(action: { initiateCall(type: "video.fill") }) {
                        Image(systemName: "video.fill")
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing, 10)
                }
                
                Button("End") {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.red)
            }
            .padding()
            .background(Color(.systemBackground))
            .shadow(radius: 2)
            
            if isMatching {
                Spacer()
                ProgressView("Finding a partner...")
                Spacer()
            } else {
                ScrollViewReader { proxy in
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(messages) { message in
                                MessageBubble(message: message)
                            }
                        }
                        .padding()
                    }
                }
                
                // Input area
                HStack {
                    TextField("Type a message...", text: $messageText)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                    
                    Button(action: sendMessage) {
                        Image(systemName: "paperplane.fill")
                            .padding(10)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                }
                .padding()
            }
        }
        .onAppear(perform: startMatching)
        .fullScreenCover(isPresented: $showCall) {
            CallView(callType: callType)
        }
    }
    
    func startMatching() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isMatching = false
            self.messages.append(ChatMessage(text: "Hello! Let's chat anonymously.", isSentByMe: false))
        }
    }
    
    func sendMessage() {
        guard !messageText.isEmpty else { return }
        let newMessage = ChatMessage(text: messageText, isSentByMe: true)
        messages.append(newMessage)
        messageText = ""
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            messages.append(ChatMessage(text: "That sounds cool!", isSentByMe: false))
        }
    }
    
    func initiateCall(type: String) {
        self.callType = type
        self.showCall = true
    }
}

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isSentByMe: Bool
}

struct MessageBubble: View {
    let message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isSentByMe { Spacer() }
            
            Text(message.text)
                .padding(12)
                .background(message.isSentByMe ? Color.blue : Color(.systemGray5))
                .foregroundColor(message.isSentByMe ? .white : .primary)
                .cornerRadius(16)
            
            if !message.isSentByMe { Spacer() }
        }
    }
}
