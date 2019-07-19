import Regex
import SwiftUI

struct ContentView: View {
  let text: String
  @State private(set) var pattern: String = ""

  var body: some View {
    NavigationView {
      VStack {
        TextField("Type a regex", text: $pattern)
          .textFieldStyle(.roundedBorder)

        HighlightedText(text, highlighting: regex) { match in
          match
            .bold()
            .foregroundColor(.red)
        }
        .lineLimit(nil)
        .foregroundColor(.secondary)

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
