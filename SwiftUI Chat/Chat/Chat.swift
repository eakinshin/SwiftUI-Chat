import SwiftUI

struct Chat: View {
  @EnvironmentObject var chatController: ChatController
  @State var composedMessage: String = ""

  var body: some View {
    NavigationView {
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
      .padding(.vertical, 20)
      .modifier(KeyboardAdaptive())
      .navigationBarTitle(Text("Chat"), displayMode: .inline)
    }
  }
  
  func sendMessage() {
    chatController.sendMessage(ChatMessage(message: composedMessage, avatar: "C", color: .green, isMe: true))
    composedMessage = ""
  }
}
