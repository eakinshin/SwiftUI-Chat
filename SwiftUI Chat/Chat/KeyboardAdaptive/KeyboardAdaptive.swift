import SwiftUI
import Combine

struct KeyboardAdaptive: ViewModifier {
  @State private var keyboardHeight: CGFloat = 0
  @State private var animation: Animation = .default

  func body(content: Content) -> some View {
    content
      .frame(height: UIScreen.main.bounds.size.height - keyboardHeight)
      .padding(.bottom, keyboardHeight)
      .onReceive(keyboardProperties) {
        keyboardHeight = $0.height
        animation = $0.animation
      }
      .animation(animation)
  }

  private var keyboardProperties: AnyPublisher<KeyboardProperties, Never> {
    Publishers.MergeMany(
      NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification),
      NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
    )
    .compactMap {
      KeyboardProperties($0)
    }
    .eraseToAnyPublisher()
  }
}
