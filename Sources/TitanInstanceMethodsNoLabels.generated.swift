import TitanCore

// Routing methods for Titan overloaded with no labels
extension Titan {

  public func get(_ path: String, _ handler: @escaping () -> Void) {
    self.get(path: path, handler: handler)
  }

  public func get(_ path: String, _ handler: @escaping () -> String) {
    self.get(path: path, handler: handler)
  }

  public func get(_ path: String, _ handler: @escaping (RequestType) -> String) {
    self.get(path: path, handler: handler)
  }

  public func get(_ path: String, _ handler: @escaping (RequestType) -> Int) {
    self.get(path: path, handler: handler)
  }

  public func post(_ path: String, _ handler: @escaping () -> Void) {
    self.post(path: path, handler: handler)
  }

  public func post(_ path: String, _ handler: @escaping () -> String) {
    self.post(path: path, handler: handler)
  }

  public func post(_ path: String, _ handler: @escaping (RequestType) -> String) {
    self.post(path: path, handler: handler)
  }

  public func post(_ path: String, _ handler: @escaping (RequestType) -> Int) {
    self.post(path: path, handler: handler)
  }

  public func put(_ path: String, _ handler: @escaping () -> Void) {
    self.put(path: path, handler: handler)
  }

  public func put(_ path: String, _ handler: @escaping () -> String) {
    self.put(path: path, handler: handler)
  }

  public func put(_ path: String, _ handler: @escaping (RequestType) -> String) {
    self.put(path: path, handler: handler)
  }

  public func put(_ path: String, _ handler: @escaping (RequestType) -> Int) {
    self.put(path: path, handler: handler)
  }

  public func patch(_ path: String, _ handler: @escaping () -> Void) {
    self.patch(path: path, handler: handler)
  }

  public func patch(_ path: String, _ handler: @escaping () -> String) {
    self.patch(path: path, handler: handler)
  }

  public func patch(_ path: String, _ handler: @escaping (RequestType) -> String) {
    self.patch(path: path, handler: handler)
  }

  public func patch(_ path: String, _ handler: @escaping (RequestType) -> Int) {
    self.patch(path: path, handler: handler)
  }

  public func delete(_ path: String, _ handler: @escaping () -> Void) {
    self.delete(path: path, handler: handler)
  }

  public func delete(_ path: String, _ handler: @escaping () -> String) {
    self.delete(path: path, handler: handler)
  }

  public func delete(_ path: String, _ handler: @escaping (RequestType) -> String) {
    self.delete(path: path, handler: handler)
  }

  public func delete(_ path: String, _ handler: @escaping (RequestType) -> Int) {
    self.delete(path: path, handler: handler)
  }

  public func options(_ path: String, _ handler: @escaping () -> Void) {
    self.options(path: path, handler: handler)
  }

  public func options(_ path: String, _ handler: @escaping () -> String) {
    self.options(path: path, handler: handler)
  }

  public func options(_ path: String, _ handler: @escaping (RequestType) -> String) {
    self.options(path: path, handler: handler)
  }

  public func options(_ path: String, _ handler: @escaping (RequestType) -> Int) {
    self.options(path: path, handler: handler)
  }

  public func head(_ path: String, _ handler: @escaping () -> Void) {
    self.head(path: path, handler: handler)
  }

  public func head(_ path: String, _ handler: @escaping () -> String) {
    self.head(path: path, handler: handler)
  }

  public func head(_ path: String, _ handler: @escaping (RequestType) -> String) {
    self.head(path: path, handler: handler)
  }

  public func head(_ path: String, _ handler: @escaping (RequestType) -> Int) {
    self.head(path: path, handler: handler)
  }

  public func route(_ method: String?, _ path: String, _ handler: @escaping () -> Void) {
    self.route(method: method, path: path, handler: handler)
  }

  public func route(_ method: String?, _ path: String, _ handler: @escaping () -> String) {
    self.route(method: method, path: path, handler: handler)
  }

  public func route(_ method: String?, _ path: String, _ handler: @escaping (RequestType) -> String) {
    self.route(method: method, path: path, handler: handler)
  }

  public func route(_ method: String?, _ path: String, _ handler: @escaping (RequestType) -> Int) {
    self.route(method: method, path: path, handler: handler)
  }

  public func addFunction(_ path: String, _ handler: @escaping () -> Void) {
    self.addFunction(path: path, handler: handler)
  }

  public func addFunction(_ path: String, _ handler: @escaping () -> String) {
    self.addFunction(path: path, handler: handler)
  }

  public func addFunction(_ path: String, _ handler: @escaping (RequestType) -> String) {
    self.addFunction(path: path, handler: handler)
  }

  public func addFunction(_ path: String, _ handler: @escaping (RequestType) -> Int) {
    self.addFunction(path: path, handler: handler)
  }

  public func get(_ path: String, _ handler: @escaping Function) {
    self.get(path: path, handler: handler)
  }

  public func post(_ path: String, _ handler: @escaping Function) {
    self.post(path: path, handler: handler)
  }

  public func put(_ path: String, _ handler: @escaping Function) {
    self.put(path: path, handler: handler)
  }

  public func patch(_ path: String, _ handler: @escaping Function) {
    self.patch(path: path, handler: handler)
  }

  public func delete(_ path: String, _ handler: @escaping Function) {
    self.delete(path: path, handler: handler)
  }

  public func options(_ path: String, _ handler: @escaping Function) {
    self.options(path: path, handler: handler)
  }

  public func head(_ path: String, _ handler: @escaping Function) {
    self.head(path: path, handler: handler)
  }

  public func route(_ method: String?, _ path: String, _ handler: @escaping Function) {
    self.route(method: method, path: path, handler: handler)
  }

  public func addFunction(_ path: String, _ handler: @escaping Function) {
    self.addFunction(path: path, handler: handler)
  }

}
