import TitanCore

//extension Titan {
//  public func get(path: String, handler: @escaping (RequestType) -> String) {
//    get(path: path, handler: toFunction(handler))
//  }
//
//  public func post(path: String, handler: @escaping (RequestType) -> Int) {
//    post(path: path, handler: toFunction(handler))
//  }
//
//  public func get(path: String, handler: @escaping () -> String) {
//    get(path: path, handler: toFunction(handler))
//  }
//
//  public func options(path: String, handler: @escaping () -> String) {
//    options(path: path, handler: toFunction(handler))
//  }
//
//  public func post(path: String, handler: @escaping () -> String) {
//    post(path: path, handler: toFunction(handler))
//  }
//
//  public func patch(path: String, handler: @escaping () -> String) {
//    patch(path: path, handler: toFunction(handler))
//  }
//
//  public func put(path: String, handler: @escaping () -> String) {
//    put(path: path, handler: toFunction(handler))
//  }
//
//  public func delete(path: String, handler: @escaping () -> String) {
//    delete(path: path, handler: toFunction(handler))
//  }
//
//  public func head(path: String, handler: @escaping () -> String) {
//    head(path: path, handler: toFunction(handler))
//  }
//
//  public func addFunction(path: String, handler: @escaping () -> Void) {
//    addFunction(path: path, handler: toFunction(handler))
//  }
//}

internal func toFunction(_ handler: @escaping () -> String) -> Function {
  return { req, res in
    return (req, Response(200, handler()))
  }
}
internal func toFunction(_ handler: @escaping (RequestType) -> String) -> Function {
  return { req, res in
    return (req, Response(200, handler(req)))
  }
}

internal func toFunction(_ handler: @escaping () -> Void) -> Function {
  return { req, res in
    handler()
    return (req, res)
  }
}

internal func toFunction(_ handler: @escaping (RequestType) -> Int) -> Function {
  return { req, res in
    return (req, Response(handler(req), ""))
  }
}
