import Combine
import SwiftUI

class ChatController : ObservableObject {
  var didChange = PassthroughSubject<Void, Never>()

  @Published var messages = [
    ChatMessage(message: "Hi", avatar: "B", color: .blue),
    ChatMessage(message: "Hello world", avatar: "A", color: .red)
  ]

  func sendMessage(_ chatMessage: ChatMessage) {
    messages.insert(chatMessage, at: 0)
    didChange.send(())
  }

}
