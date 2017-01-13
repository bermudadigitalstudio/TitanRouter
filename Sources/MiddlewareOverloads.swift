import TitanCore

extension Titan {
  private func toFunction(_ handler: @escaping () -> String) -> Function {
    return { req, res in
      return (req, Response(200, handler()))
    }
  }
  private func toFunction(_ handler: @escaping (RequestType) -> String) -> Function {
    return { req, res in
      return (req, Response(200, handler(req)))
    }
  }

  private func toFunction(_ handler: @escaping () -> ()) -> Function {
    return { req, res in
      handler()
      return (req, res)
    }
  }

  private func toFunction(_ handler: @escaping (RequestType) -> Int) -> Function {
    return { req, res in
      return (req, Response(handler(req), ""))
    }
  }

  public func get(_ path: String, handler: @escaping (RequestType) -> String) {
    get(path: path, handler: toFunction(handler))
  }

  public func post(_ path: String, handler: @escaping (RequestType) -> Int) {
    post(path: path, handler: toFunction(handler))
  }

  public func get(_ path: String, handler: @escaping () -> String) {
    get(path: path, handler: toFunction(handler))
  }

  public func options(_ path: String, handler: @escaping () -> String) {
    options(path: path, handler: toFunction(handler))
  }

  public func post(_ path: String, handler: @escaping () -> String) {
    post(path: path, handler: toFunction(handler))
  }

  public func patch(_ path: String, handler: @escaping () -> String) {
    patch(path: path, handler: toFunction(handler))
  }

  public func put(_ path: String, handler: @escaping () -> String) {
    put(path: path, handler: toFunction(handler))
  }

  public func delete(_ path: String, handler: @escaping () -> String) {
    delete(path: path, handler: toFunction(handler))
  }

  public func head(_ path: String, handler: @escaping () -> String) {
    head(path: path, handler: toFunction(handler))
  }

  public func addFunction(_ path: String, handler: @escaping () -> ()) {
    addFunction(path: path, handler: toFunction(handler))
  }
}
