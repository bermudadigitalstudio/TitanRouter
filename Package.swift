import PackageDescription

let package = Package(
    name: "TitanRouter",
    dependencies: [
      .Package(url: "https://github.com/bermudadigitalstudio/titan-core.git", majorVersion: 0)
    ]
)
