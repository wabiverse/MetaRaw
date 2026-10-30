// swift-tools-version: 5.10
import PackageDescription

let package = Package(
  name: "MetaRaw",
  platforms: [
    .macOS(.v14),
    .visionOS(.v1),
    .iOS(.v17),
    .tvOS(.v17),
    .watchOS(.v10),
  ],
  products: [
    .library(
      name: "Raw",
      type: .dynamic,
      targets: ["Raw"]
    ),
  ],
  targets: [
    .target(
      name: "Raw",
      dependencies: [],
      exclude: [],
      publicHeadersPath: "include",
      cxxSettings: [
        .headerSearchPath("."),
        .define("_ALLOW_COMPILER_AND_STL_VERSION_MISMATCH", .when(platforms: [.windows])),
        .define("_ALLOW_KEYWORD_MACROS", to: "1", .when(platforms: [.windows])),
        .define("static_assert(_conditional, ...)", to: "", .when(platforms: [.windows])),
        .define("LIBRAW_BUILDLIB", .when(platforms: [.windows])),
      ]
    ),
  ],
  cLanguageStandard: .gnu17,
  cxxLanguageStandard: .cxx17
)
