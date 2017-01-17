import TitanCore

// Overload all Titan instance methods which take a `Function` to take various convenient overloads.

extension Titan {


  public func get(path: String, handler: @escaping () -> Void) {
    self.get(path: path, handler: toFunction(handler))
  }
  public func get(path: String, handler: @escaping () -> String) {
    self.get(path: path, handler: toFunction(handler))
  }
  public func get(path: String, handler: @escaping (RequestType) -> String) {
    self.get(path: path, handler: toFunction(handler))
  }
  public func get(path: String, handler: @escaping (RequestType) -> Int) {
    self.get(path: path, handler: toFunction(handler))
  }
  public func get(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.get(path: path, handler: toFunction(handler))
  }
  public func get(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.get(path: path, handler: toFunction(handler))
  }



  public func post(path: String, handler: @escaping () -> Void) {
    self.post(path: path, handler: toFunction(handler))
  }
  public func post(path: String, handler: @escaping () -> String) {
    self.post(path: path, handler: toFunction(handler))
  }
  public func post(path: String, handler: @escaping (RequestType) -> String) {
    self.post(path: path, handler: toFunction(handler))
  }
  public func post(path: String, handler: @escaping (RequestType) -> Int) {
    self.post(path: path, handler: toFunction(handler))
  }
  public func post(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.post(path: path, handler: toFunction(handler))
  }
  public func post(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.post(path: path, handler: toFunction(handler))
  }



  public func put(path: String, handler: @escaping () -> Void) {
    self.put(path: path, handler: toFunction(handler))
  }
  public func put(path: String, handler: @escaping () -> String) {
    self.put(path: path, handler: toFunction(handler))
  }
  public func put(path: String, handler: @escaping (RequestType) -> String) {
    self.put(path: path, handler: toFunction(handler))
  }
  public func put(path: String, handler: @escaping (RequestType) -> Int) {
    self.put(path: path, handler: toFunction(handler))
  }
  public func put(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.put(path: path, handler: toFunction(handler))
  }
  public func put(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.put(path: path, handler: toFunction(handler))
  }



  public func patch(path: String, handler: @escaping () -> Void) {
    self.patch(path: path, handler: toFunction(handler))
  }
  public func patch(path: String, handler: @escaping () -> String) {
    self.patch(path: path, handler: toFunction(handler))
  }
  public func patch(path: String, handler: @escaping (RequestType) -> String) {
    self.patch(path: path, handler: toFunction(handler))
  }
  public func patch(path: String, handler: @escaping (RequestType) -> Int) {
    self.patch(path: path, handler: toFunction(handler))
  }
  public func patch(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.patch(path: path, handler: toFunction(handler))
  }
  public func patch(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.patch(path: path, handler: toFunction(handler))
  }



  public func delete(path: String, handler: @escaping () -> Void) {
    self.delete(path: path, handler: toFunction(handler))
  }
  public func delete(path: String, handler: @escaping () -> String) {
    self.delete(path: path, handler: toFunction(handler))
  }
  public func delete(path: String, handler: @escaping (RequestType) -> String) {
    self.delete(path: path, handler: toFunction(handler))
  }
  public func delete(path: String, handler: @escaping (RequestType) -> Int) {
    self.delete(path: path, handler: toFunction(handler))
  }
  public func delete(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.delete(path: path, handler: toFunction(handler))
  }
  public func delete(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.delete(path: path, handler: toFunction(handler))
  }



  public func options(path: String, handler: @escaping () -> Void) {
    self.options(path: path, handler: toFunction(handler))
  }
  public func options(path: String, handler: @escaping () -> String) {
    self.options(path: path, handler: toFunction(handler))
  }
  public func options(path: String, handler: @escaping (RequestType) -> String) {
    self.options(path: path, handler: toFunction(handler))
  }
  public func options(path: String, handler: @escaping (RequestType) -> Int) {
    self.options(path: path, handler: toFunction(handler))
  }
  public func options(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.options(path: path, handler: toFunction(handler))
  }
  public func options(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.options(path: path, handler: toFunction(handler))
  }



  public func head(path: String, handler: @escaping () -> Void) {
    self.head(path: path, handler: toFunction(handler))
  }
  public func head(path: String, handler: @escaping () -> String) {
    self.head(path: path, handler: toFunction(handler))
  }
  public func head(path: String, handler: @escaping (RequestType) -> String) {
    self.head(path: path, handler: toFunction(handler))
  }
  public func head(path: String, handler: @escaping (RequestType) -> Int) {
    self.head(path: path, handler: toFunction(handler))
  }
  public func head(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.head(path: path, handler: toFunction(handler))
  }
  public func head(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.head(path: path, handler: toFunction(handler))
  }



  public func route(method: String?, path: String, handler: @escaping () -> Void) {
    self.route(method: method, path: path, handler: toFunction(handler))
  }
  public func route(method: String?, path: String, handler: @escaping () -> String) {
    self.route(method: method, path: path, handler: toFunction(handler))
  }
  public func route(method: String?, path: String, handler: @escaping (RequestType) -> String) {
    self.route(method: method, path: path, handler: toFunction(handler))
  }
  public func route(method: String?, path: String, handler: @escaping (RequestType) -> Int) {
    self.route(method: method, path: path, handler: toFunction(handler))
  }
  public func route(method: String?, path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.route(method: method, path: path, handler: toFunction(handler))
  }
  public func route(method: String?, path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.route(method: method, path: path, handler: toFunction(handler))
  }



  public func addFunction(path: String, handler: @escaping () -> Void) {
    self.addFunction(path: path, handler: toFunction(handler))
  }
  public func addFunction(path: String, handler: @escaping () -> String) {
    self.addFunction(path: path, handler: toFunction(handler))
  }
  public func addFunction(path: String, handler: @escaping (RequestType) -> String) {
    self.addFunction(path: path, handler: toFunction(handler))
  }
  public func addFunction(path: String, handler: @escaping (RequestType) -> Int) {
    self.addFunction(path: path, handler: toFunction(handler))
  }
  public func addFunction(path: String, handler: @escaping (inout Request, inout Response) -> Void) {
    self.addFunction(path: path, handler: toFunction(handler))
  }
  public func addFunction(path: String, handler: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) {
    self.addFunction(path: path, handler: toFunction(handler))
  }


}
