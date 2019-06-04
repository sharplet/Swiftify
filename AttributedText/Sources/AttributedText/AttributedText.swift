import SwiftUI

public struct AttributedText: View {
  private var text: NSMutableAttributedString

  public init<C: Collection>(_ text: String, attributes: C) where C.Element == (Range<String.Index>, [NSAttributedString.Key: Any]) {
    self.text = NSMutableAttributedString(string: text)
    for (range, attributes) in attributes {
      let nsRange = NSRange(range, in: text)
      self.text.addAttributes(attributes, range: nsRange)
    }
  }
}

#if canImport(UIKit)
extension AttributedText: UIViewRepresentable {
  public func makeUIView(context: UIViewRepresentableContext<AttributedText>) -> UIView {
    return AttributedTextContainer()
  }

  public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<AttributedText>) {
    let container = uiView as! AttributedTextContainer
    container.label.attributedText = text
    container.label.numberOfLines = context.environment.lineLimit ?? 0
  }
}

private class AttributedTextContainer: UIView {
  let label: UILabel
  private var oldWidth: CGFloat = 0

  override init(frame: CGRect) {
    label = UILabel(frame: frame)
    label.translatesAutoresizingMaskIntoConstraints = false
    super.init(frame: frame)
    oldWidth = bounds.width
    addSubview(label)
  }

  override func layoutSubviews() {
    defer { oldWidth = bounds.width }
    super.layoutSubviews()
    if bounds.width != oldWidth {
      label.frame.size.width = bounds.width
      label.sizeToFit()
    }
  }

  required init?(coder: NSCoder) {
    fatalError("unimplemented")
  }

  override var intrinsicContentSize: CGSize {
    return label.frame.size
  }
}
#endif
