import Regex
import SwiftUI

struct HighlightedText: View {
  private typealias Segment = (range: Range<String.Index>, isMatch: Bool)

  private let content: String
  private let regex: Regex?
  private let onMatch: (Text) -> Text

  init(_ content: String, highlighting regex: Regex?, onMatch: @escaping (Text) -> Text) {
    self.content = content
    self.regex = regex
    self.onMatch = onMatch
  }

  var body: Text {
    segments.reduce(Text(verbatim: "")) { text, segment in
      let match = Text(content[segment.range])
      return text + (segment.isMatch ? onMatch(match) : match)
    }
  }

  private var segments: [Segment] {
    let matches = regex?.allMatches(in: content) ?? []
    var position = content.startIndex
    var segments: [Segment] = []

    for match in matches {
      let before = position ..< match.range.lowerBound
      if !before.isEmpty {
        segments.append((range: before, isMatch: false))
      }
      segments.append((range: match.range, isMatch: true))
      position = match.range.upperBound
    }

    let remaining = position ..< content.endIndex
    if !remaining.isEmpty {
      segments.append((remaining, isMatch: false))
    }

    return segments
  }
}
