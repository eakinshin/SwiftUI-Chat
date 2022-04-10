import SwiftUI

struct Chat: View {
  @EnvironmentObject var chatController: ChatController
  @State var composedMessage: String = ""

  var body: some View {
    NavigationView {
      VStack(spacing: 0) {
        ScrollView {
          VStack {
            ForEach(chatController.messages, id: \.self) { msg in
              ChatRow(chatMessage: msg)
                .rotationEffect(.radians(.pi))
                .scaleEffect(x: -1, y: 1, anchor: .center)
            }
          }
        }
        .rotationEffect(.radians(.pi))
        .scaleEffect(x: -1, y: 1, anchor: .center)
        .padding(.horizontal, 16)
        HStack(alignment: .center) {
          TextField("Message...", text: $composedMessage)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .frame(minHeight: CGFloat(24))
            .cornerRadius(24)
            .overlay(
              RoundedRectangle(cornerRadius: 24)
                .stroke(Color.gray, lineWidth: 1)
            )
          Button(action: sendMessage) {
            Image(systemName: "paperplane.fill")
          }
          .disabled(composedMessage.isEmpty)
        }
        .frame(minHeight: CGFloat(32)).padding()
      }
      .padding(.vertical, 24)
      .modifier(KeyboardAdaptive())
      .navigationBarTitle(Text("Chat"), displayMode: .inline)
    }
  }
  
  func sendMessage() {
    chatController.sendMessage(ChatMessage(message: composedMessage, avatar: "C", color: .green, isMe: true))
    composedMessage = ""
  }
}
