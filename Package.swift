import PackageDescription

var package = Package(
    name: "TitanRouter",
    dependencies: [
      .Package(url: "https://github.com/bermudadigitalstudio/TitanCore.git", majorVersion: 0, minor: 1)
    ]
)

// Uncomment the following to install sourcery for development
//package.dependencies.append(
// .Package(url: "https://github.com/krzysztofzablocki/Sourcery.git", "0.5.0")
//)
