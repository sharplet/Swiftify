// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "AttributedText",
  platforms: [
    .iOS(.v13),
  ],
  products: [
    .library(name: "AttributedText", targets: ["AttributedText"]),
  ],
  targets: [
    .target(name: "AttributedText"),
  ]
)
