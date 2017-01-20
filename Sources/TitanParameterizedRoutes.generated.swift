import TitanCore

// Extend all route methods to access path components directly

extension Titan {

  public func get(pathTemplate: String, handler: @escaping (RequestType, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 1)
    self.get(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func get(pathTemplate: String, handler: @escaping (RequestType, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 2)
    self.get(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func get(pathTemplate: String, handler: @escaping (RequestType, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 3)
    self.get(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func get(pathTemplate: String, handler: @escaping (RequestType, String, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 4)
    self.get(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func get(pathTemplate: String, handler: @escaping (RequestType, String, String, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 5)
    self.get(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }

  public func post(pathTemplate: String, handler: @escaping (RequestType, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 1)
    self.post(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func post(pathTemplate: String, handler: @escaping (RequestType, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 2)
    self.post(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func post(pathTemplate: String, handler: @escaping (RequestType, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 3)
    self.post(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func post(pathTemplate: String, handler: @escaping (RequestType, String, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 4)
    self.post(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func post(pathTemplate: String, handler: @escaping (RequestType, String, String, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 5)
    self.post(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }

  public func put(pathTemplate: String, handler: @escaping (RequestType, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 1)
    self.put(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func put(pathTemplate: String, handler: @escaping (RequestType, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 2)
    self.put(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func put(pathTemplate: String, handler: @escaping (RequestType, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 3)
    self.put(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func put(pathTemplate: String, handler: @escaping (RequestType, String, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 4)
    self.put(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func put(pathTemplate: String, handler: @escaping (RequestType, String, String, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 5)
    self.put(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }

  public func patch(pathTemplate: String, handler: @escaping (RequestType, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 1)
    self.patch(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func patch(pathTemplate: String, handler: @escaping (RequestType, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 2)
    self.patch(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func patch(pathTemplate: String, handler: @escaping (RequestType, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 3)
    self.patch(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func patch(pathTemplate: String, handler: @escaping (RequestType, String, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 4)
    self.patch(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func patch(pathTemplate: String, handler: @escaping (RequestType, String, String, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 5)
    self.patch(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }

  public func delete(pathTemplate: String, handler: @escaping (RequestType, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 1)
    self.delete(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func delete(pathTemplate: String, handler: @escaping (RequestType, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 2)
    self.delete(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func delete(pathTemplate: String, handler: @escaping (RequestType, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 3)
    self.delete(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func delete(pathTemplate: String, handler: @escaping (RequestType, String, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 4)
    self.delete(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func delete(pathTemplate: String, handler: @escaping (RequestType, String, String, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 5)
    self.delete(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }

  public func options(pathTemplate: String, handler: @escaping (RequestType, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 1)
    self.options(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func options(pathTemplate: String, handler: @escaping (RequestType, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 2)
    self.options(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func options(pathTemplate: String, handler: @escaping (RequestType, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 3)
    self.options(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func options(pathTemplate: String, handler: @escaping (RequestType, String, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 4)
    self.options(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func options(pathTemplate: String, handler: @escaping (RequestType, String, String, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 5)
    self.options(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }

  public func head(pathTemplate: String, handler: @escaping (RequestType, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 1)
    self.head(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func head(pathTemplate: String, handler: @escaping (RequestType, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 2)
    self.head(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func head(pathTemplate: String, handler: @escaping (RequestType, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 3)
    self.head(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func head(pathTemplate: String, handler: @escaping (RequestType, String, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 4)
    self.head(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }
  public func head(pathTemplate: String, handler: @escaping (RequestType, String, String, String, String, String, ResponseType) -> (RequestType, ResponseType)) {
    precondition(pathTemplate.wildcards == 5)
    self.head(path: pathTemplate, handler: toFunction(handler, with: pathTemplate))
  }

}
