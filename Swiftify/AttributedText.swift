import SwiftUI

struct AttributedText: UIViewRepresentable {
  private let string: NSMutableAttributedString

  init(_ text: String, attributes: [Range<String.Index>: [NSAttributedString.Key: Any]] = [:]) {
    string = NSMutableAttributedString(string: text)
    for (range, attributes) in attributes {
      let nsRange = NSRange(range, in: text)
      string.addAttributes(attributes, range: nsRange)
    }
  }

  func makeUIView(context: UIViewRepresentableContext<AttributedText>) -> UIView {
    let parent = UIView()

    let label = UILabel()
    label.text = string.string
    label.translatesAutoresizingMaskIntoConstraints = false
    parent.addSubview(label)

    label.leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
    label.trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
    label.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
    label.bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true

    return parent
  }

  func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<AttributedText>) {
    let label = uiView.subviews.first as! UILabel
    label.attributedText = string

    if let lineLimit = context.environment.lineLimit {
      label.numberOfLines = lineLimit
    }
  }
}
