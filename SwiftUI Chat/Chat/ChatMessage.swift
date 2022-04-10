import SwiftUI

struct ChatMessage : Hashable {
  var message: String
  var avatar: String
  var color: Color
  var isMe: Bool = false
}
