import SwiftUI
import Regex
import UIKit

struct ContentView: View {
  @State var pattern: String = ""
  let text = String.loremIpsum

  var body: some View {
    return VStack {
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
    matches.reduce(into: [:]) { attributes, match in
      attributes[match.range] = [.font: UIFont.bold, .foregroundColor: UIColor.red]
    }
  }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
