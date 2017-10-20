import TitanCore

extension Request {
  public init(_ method: String = "GET", _ path: String = "/", _ body: String = "", _ headers: [Header] = []) {
    self.init(method: method, path: path, body: body, headers: headers)
  }
}

extension Response {
  public init(_ code: Int = 200, _ body: String = "", _ headers: [Header] = []) {
    self.init(code: code, body: body, headers: headers)
  }
}
