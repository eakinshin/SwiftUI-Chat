import SwiftUI

struct ChatRow : View {
  var chatMessage: ChatMessage
  var body: some View {
    HStack {
      if !chatMessage.isMe {
        avatar
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
        avatar
      }
    }
  }

  private var avatar: some View {
    Text(chatMessage.avatar)
      .foregroundColor(.white)
      .frame(width: 24, height: 24, alignment: .center)
      .background(Color.gray)
      .clipShape(Circle())
  }
}
