import AttributedText
import Regex
import SwiftUI

struct ContentView: View {
  @State private var pattern: String = ""
  let text = String.loremIpsum
  let textStyle = UIFont.TextStyle.callout

  var body: some View {
    VStack {
      TextField($pattern, placeholder: Text("Type a regex"))

      AttributedText(text, attributes: highlightAttributes)
        .lineLimit(0)
    }.padding()
  }

  var regex: Regex? {
    try? Regex(string: pattern, options: .ignoreCase)
  }

  var matches: [MatchResult] {
    regex?.allMatches(in: text) ?? []
  }

  var highlightAttributes: [Range<String.Index>: [NSAttributedString.Key: Any]] {
    matches.reduce(into: baseAttributes) { attributes, match in
      attributes[match.range] = [
        .font: UIFont.boldFont(withTextStyle: textStyle),
        .foregroundColor: UIColor.red,
      ]
    }
  }

  var baseAttributes: [Range<String.Index>: [NSAttributedString.Key: Any]] {
    [Range(text): [
      .font: UIFont.preferredFont(forTextStyle: textStyle),
    ]]
  }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
