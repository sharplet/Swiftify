import Regex
import SwiftUI

struct ContentView: View {
  let text: String
  @State private(set) var pattern: String = ""

  var body: some View {
    NavigationView {
      VStack {
        TextField($pattern, placeholder: Text("Type a regex"))

        HighlightedText(text, highlighting: regex) { match in
          match
            .bold()
            .color(.red)
        }
        .lineLimit(nil)

        Spacer()
      }
      .padding()
      .navigationBarTitle(Text("Regex"))
    }
  }

  private var regex: Regex? {
    try? Regex(string: pattern, options: .ignoreCase)
  }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(text: .loremIpsum, pattern: "lorem")
  }
}
#endif
