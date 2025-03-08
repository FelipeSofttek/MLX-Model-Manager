// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "mlx-model-manager",
    platforms: [.macOS(.v14), .iOS(.v16)],
    products: [
        .library(
            name: "MLXModelManager",
            targets: ["MLXModelManager"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ml-explore/mlx-swift", from: "0.21.3"),
        .package(url: "https://github.com/FelipeSofttek/swift-transformers", branch: "main"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.5.0"),
        .package(url: "https://github.com/1024jp/GzipSwift", "6.0.1" ... "6.0.1"),
        .package(url: "https://github.com/apple/swift-async-algorithms", from: "1.0.3"),
    ],
    targets: [
        .target(
            name: "MLXLMCommonn",
            dependencies: [
                .product(name: "MLX", package: "mlx-swift"),
                .product(name: "MLXNN", package: "mlx-swift"),
                .product(name: "MLXOptimizers", package: "mlx-swift"),
                .product(name: "MLXRandom", package: "mlx-swift"),
                .product(name: "Transformers", package: "swift-transformers"),
            ],
            path: "Sources/MLXLMCommonn",
            exclude: [
                "README.md"
            ],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "MLXModelManager",
            dependencies: [
                "MLXLMCommonn",
                .product(name: "MLX", package: "mlx-swift"),
                .product(name: "MLXFast", package: "mlx-swift"),
                .product(name: "MLXNN", package: "mlx-swift"),
                .product(name: "MLXOptimizers", package: "mlx-swift"),
                .product(name: "MLXRandom", package: "mlx-swift"),
                .product(name: "Transformers", package: "swift-transformers"),
            ],
            path: "Sources/MLXModelManager",
            exclude: [
                "README.md"
            ],
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        ),
    ]
)


