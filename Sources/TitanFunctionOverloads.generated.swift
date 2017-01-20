import TitanCore

// Overload all Titan instance methods which take a `Function` to take mutable overloads.

extension Titan { 
  public func get(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.get(path: path, handler: toFunction(handler))
  }
  public func get(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.get(path: path, handler: toFunction(handler))
  }
  public func post(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.post(path: path, handler: toFunction(handler))
  }
  public func post(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.post(path: path, handler: toFunction(handler))
  }
  public func put(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.put(path: path, handler: toFunction(handler))
  }
  public func put(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.put(path: path, handler: toFunction(handler))
  }
  public func patch(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.patch(path: path, handler: toFunction(handler))
  }
  public func patch(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.patch(path: path, handler: toFunction(handler))
  }
  public func delete(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.delete(path: path, handler: toFunction(handler))
  }
  public func delete(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.delete(path: path, handler: toFunction(handler))
  }
  public func options(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.options(path: path, handler: toFunction(handler))
  }
  public func options(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.options(path: path, handler: toFunction(handler))
  }
  public func head(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.head(path: path, handler: toFunction(handler))
  }
  public func head(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.head(path: path, handler: toFunction(handler))
  }
  public func route(method: String?, path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.route(method: method, path: path, handler: toFunction(handler))
  }
  public func route(method: String?, path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.route(method: method, path: path, handler: toFunction(handler))
  }
  public func addFunction(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.addFunction(path: path, handler: toFunction(handler))
  }
  public func addFunction(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.addFunction(path: path, handler: toFunction(handler))
  }
  public func allMethods(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.allMethods(path: path, handler: toFunction(handler))
  }
  public func allMethods(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.allMethods(path: path, handler: toFunction(handler))
  }
}
