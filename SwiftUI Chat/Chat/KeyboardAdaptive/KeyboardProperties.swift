import SwiftUI

struct KeyboardProperties {
  var height: CGFloat = 0
  var animation: Animation = .easeInOut(duration: 0)

  init?(_ n: Notification) {
    guard let height = (n.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height else {
      return
    }
    if n.name == UIResponder.keyboardWillShowNotification {
      self.height = height
    }
    let animationCurve = n.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UIView.AnimationCurve ?? .easeInOut
    let animationDuration = n.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
    switch animationCurve {
    case .easeInOut:
      animation = .easeInOut(duration: animationDuration)
    case .easeIn:
      animation = .easeIn(duration: animationDuration)
    case .easeOut:
      animation = .easeOut(duration: animationDuration)
    case .linear:
      animation = .linear(duration: animationDuration)
    default:
      animation = .easeInOut(duration: animationDuration)
    }
  }
}

