import UIKit

extension UIFont {
  static var bold: UIFont {
    let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body)
      .withSymbolicTraits(.traitBold)!
    return UIFont(descriptor: descriptor, size: 0)
  }
}
