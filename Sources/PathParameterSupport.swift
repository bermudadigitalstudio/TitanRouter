import TitanCore

public extension Titan {
  public func get(pathTemplate: String, handler: @escaping (RequestType, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 1)
    self.get(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
}

func toFunction(_ handler: @escaping (RequestType, String, ResponseType) -> (RequestType, ResponseType), with pathTemplate: String) -> Function {
  return { req, res in
    let param = extractParameter(from: req.path, with: pathTemplate)
    return handler(req, param, res)
  }
}

/// Where the `path` is /users/567/email
/// Where the `template` is /users/*/email
/// return 567

func extractParameter(from path: String, with template: String) -> String {
  let z = splitAndZip(path: path, route: template)
  for (pathComp, templateComp) in z {
    guard templateComp == "*" else {
      continue
    }
    return pathComp
  }
  return ""
}

extension String {

  var wildcards: Int {
    return self.characters.reduce(0) { (count, char) in
      if char == "*" {
        return count + 1
      } else {
        return count
      }
    }
  }
}
