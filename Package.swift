import PackageDescription

var package = Package(
    name: "TitanRouter",
    dependencies: [
      .Package(url: "https://github.com/bermudadigitalstudio/TitanCore.git", majorVersion: 0, minor: 2)
    ]
)
