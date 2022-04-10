import SwiftUI

struct ChatRow : View {
  var chatMessage: ChatMessage
  var body: some View {
    HStack {
      if !chatMessage.isMe {
        Text(chatMessage.avatar)
      } else {
        Spacer()
      }
      Text(chatMessage.message)
        .bold()
        .padding(10)
        .foregroundColor(Color.white)
        .background(chatMessage.color)
        .cornerRadius(10)
      if chatMessage.isMe {
        Text(chatMessage.avatar)
      }
    }
  }
}
