import SwiftUI

struct Chat: View {
  @State var composedMessage: String = ""
  @EnvironmentObject var chatController: ChatController

  var body: some View {
    VStack {
      List {
        ForEach(chatController.messages, id: \.self) { msg in
          ChatRow(chatMessage: msg)
        }
      }
      HStack {
        TextField("Message...", text: $composedMessage).frame(minHeight: CGFloat(30))
        Button(action: sendMessage) {
          Text("Send")
        }
      }.frame(minHeight: CGFloat(50)).padding()
    }
  }
  
  func sendMessage() {
    chatController.sendMessage(ChatMessage(message: composedMessage, avatar: "C", color: .green, isMe: true))
    composedMessage = ""
  }
}
