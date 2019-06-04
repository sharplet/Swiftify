import Regex
import SwiftUI

struct ContentView: View {
  @State private var pattern: String = ""

  let text = String.loremIpsum
  let textStyle = UIFont.TextStyle.callout

  var body: some View {
    return VStack {
      TextField($pattern, placeholder: Text("Type a regex"))
      HighlightedText(text, highlighting: regex) { match in
        match.bold().color(.red)
      }
    }.padding().lineLimit(nil)
  }

  private var regex: Regex? {
    try? Regex(string: pattern, options: .ignoreCase)
  }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
