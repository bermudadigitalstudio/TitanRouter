import PackageDescription

var package = Package(
    name: "TitanRouter",
    dependencies: [
      .Package(url: "https://github.com/bermudadigitalstudio/titan-core.git", majorVersion: 0)
    ]
)

// Uncomment the following to install sourcery for development
package.dependencies.append(
 .Package(url: "https://github.com/krzysztofzablocki/Sourcery.git", "0.5.0")
)
