import XCTest
import TitanRouter
import TitanCore

extension String: ResponseType {
  public var body: String {
    return self
  }

  public var code: Int {
    return 200
  }

  public var headers: [Header] {
    return []
  }
}

extension Int: ResponseType {
  public var code: Int { return self }
  public var body: String { return "" }
  public var headers: [Header] { return [] }
}

final class TitanRouterTests: XCTestCase {
  var app: Titan!
  override func setUp() {
    app = Titan()
  }

  func testBasicGet() {
    app.route(method: "GET", path: "/username") { req, res in
      return (req, "swizzlr")
    }
    XCTAssertEqual(app.app(request: Request("GET", "/username")).body, "swizzlr")
  }

  func testTitanEcho() {
    app.route(path: "/echoMyBody") { req, _ in
      return (req, req.body)
    }
    XCTAssertEqual(app.app(request: Request("GET", "/echoMyBody", "hello, this is my body")).body,
                   "hello, this is my body")
  }

  func testMultipleRoutes() {
    app.route(path: "/username") { req, _ in
      return (req, "swizzlr")
    }

    app.route(path: "/echoMyBody") { req, _ in
      return (req, req.body)
    }
    XCTAssertEqual(app.app(request: Request("GET", "/echoMyBody", "hello, this is my body")).body,
                   "hello, this is my body")
    XCTAssertEqual(app.app(request: Request("GET", "/username")).body, "swizzlr")
  }

  func testMiddlewareFunction() {
    var start = Date()
    var end = start
    app.addFunction(path: "*") {
      start = Date()
      return $0
    }
    app.route(path: "/username") { req, _ in
      return (req, "swizzlr")
    }
    app.addFunction(path: "*") {
      end = Date()
      return $0
    }
    _ = app.app(request: Request("GET", "/username"))
    XCTAssertNotEqual(start, end)
  }

  func testSamePathDifferentiationByMethod() {
    var username = ""

    app.route(method: "get", path: "/username") { req, _ in
      return (req, username)
    }

    app.route(method: "post", path: "/username") { req, _ in
      username = req.body
      return (req, 201)
    }

    let resp = app.app(request: Request("POST", "/username", "Lisa"))
    XCTAssertEqual(resp.code, 201)
    XCTAssertEqual(app.app(request: Request("GET", "/username")).body, "Lisa")
  }
}
