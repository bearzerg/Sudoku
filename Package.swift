// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Sudoku",
    products: [
        .executable(name: "sudoku", targets: ["Sudoku"]),
        .library(name: "SudokuKit", targets: ["SudokuKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/eneko/CommandRegistry", from: "0.0.0"),
        .package(url: "https://github.com/onevcat/Rainbow", from: "3.0.0"),
        .package(url: "https://github.com/scottrhoyt/SwiftyTextTable.git", from: "0.5.0"),
        .package(url: "https://github.com/apple/swift-package-manager.git", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "Sudoku",
            dependencies: ["CommandRegistry", "Rainbow", "SudokuKit", "SwiftPM"]),
        .target(
            name: "SudokuKit",
            dependencies: ["SwiftyTextTable", "Rainbow"]),
        .testTarget(
            name: "SudokuKitTests",
            dependencies: ["SudokuKit"]),
    ]
)
