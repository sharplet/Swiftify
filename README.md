# SwiftUI + Swift Package Manager Demo

Requires Xcode 11 beta.

- Adds a barebones `AttributedText` view that renders using
  `NSAttributedString` and `UILabel`

- Using [Regex][], via Xcode's new Swift Package Manager integration, accepts a
  regular expression string as input and highlights all matches in the text.

![Typing a regular expression into a text field highlights all matches in the "lorem ipsum" sample text](bindings.gif)

[Regex]: https://github.com/sharplet/Regex
