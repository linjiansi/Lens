// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Lens",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Lens",
            targets: ["Lens"]
        ),
    ],
    dependencies: [
        .package(
            name: "Utilities",
            path: "../Utilities"
        )
    ],
    targets: [
        .target(
            name: "Lens",
            dependencies: [
                "Utilities"
            ]
        ),
        .testTarget(
            name: "LensTests",
            dependencies: ["Lens"]
        ),
    ]
)
