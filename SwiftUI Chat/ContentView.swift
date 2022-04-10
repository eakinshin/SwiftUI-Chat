import SwiftUI

struct ContentView : View {
  @EnvironmentObject var chatController: ChatController
  var body: some View {
    Chat()
      .environmentObject(chatController)
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
