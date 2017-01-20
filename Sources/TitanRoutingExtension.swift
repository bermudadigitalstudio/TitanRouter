import TitanCore

extension Titan {
  /// Core routing handler for Titan Routing.
  /// Passing `nil` for the method results in matching all methods for a given path
  /// Path matching is defined in `matchRoute` method, documented in `docs/Routes.md`
  public func route(method: String? = nil, path: String, handler: @escaping Function) {
    let routeFunction: Function = { (req, res) in
      if let m = method, m.uppercased() != req.method.uppercased() {
        return (req, res)
      }
      guard matchRoute(path: req.path, route: path) else {
        return (req, res)
      }
      return handler(req, res)
    }
    addFunction(routeFunction)
  }

  /// Synonym for `route`
  public func addFunction(path: String, handler: @escaping Function) {
    route(path: path, handler: handler)
  }

  /// Synonym for `route`
  public func allMethods(path: String, handler: @escaping Function) {
    route(path: path, handler: handler)
  }

}

/// Match a given path with a route. Segments containing an asterisk are treated as wild.
private func matchRoute(path: String, route: String) -> Bool {
  guard route != "*" else { return true }
  guard route.wildcards != 0 else {
    return path == route
  }
  let splitRoute = route.characters.split(separator: "/").map { String($0) }
  let splitPath = path.characters.split(separator: "/").map { String($0) }
  let zipped = zip(splitRoute, splitPath)
  for (routeSegment, pathSegment) in zipped {
    if (routeSegment != pathSegment) && (routeSegment != "*") {
      return false
    } else {
      continue
    }
  }
  return true
}
