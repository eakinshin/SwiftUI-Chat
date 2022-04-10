import SwiftUI

struct ChatMessage : Hashable {
  var message: String
  var avatar: String
  var color: Color
  var isMe: Bool = false
}

struct ContentView : View {
  @EnvironmentObject var chatController: ChatController
  
  var body: some View {
    Chat()
      .environmentObject(chatController)
  }
}

struct ChatRow : View {
  var chatMessage: ChatMessage
  var body: some View {
    Group {
      if !chatMessage.isMe {
        HStack {
          Group {
            Text(chatMessage.avatar)
            Text(chatMessage.message)
              .bold()
              .padding(10)
              .foregroundColor(Color.white)
              .background(chatMessage.color)
              .cornerRadius(10)
          }
        }
      } else {
        HStack {
          Group {
            Spacer()
            Text(chatMessage.message)
              .bold()
              .foregroundColor(Color.white)
              .padding(10)
              .background(chatMessage.color)
              .cornerRadius(10)
            Text(chatMessage.avatar)
          }
        }
      }
    }
  }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(ChatController())
  }
}
#endif
