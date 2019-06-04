import UIKit

extension UIFont {
  static func boldFont(withTextStyle: UIFont.TextStyle) -> UIFont {
    let descriptor = UIFontDescriptor
      .preferredFontDescriptor(withTextStyle: withTextStyle)
      .withSymbolicTraits(.traitBold)!
    return UIFont(descriptor: descriptor, size: 0)
  }
}
