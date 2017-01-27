import XCTest
import TitanRouter
import TitanCore

extension Response {
  init(_ string: String) {
    self.body = string
    self.code = 200
    self.headers = []
  }
}

final class TitanRouterTests: XCTestCase {
  var app: Titan!
  override func setUp() {
    app = Titan()
  }

  func testFunctionalMutableParams() {
    let app = Titan()
    app.get("/init") { (req, res) -> (RequestType, ResponseType) in
      var newReq = req.copy()
      var newRes = res.copy()
      newRes.body = "Hello World"
      newReq.path = "/rewritten"
      newRes.code = 500
      return (newReq, newRes)
    }
    app.addFunction { (req, res) -> (RequestType, ResponseType) in
      XCTAssertEqual(req.path, "/rewritten")
      return (req, res)
    }
    let response = app.app(request: Request(method: "GET", path: "/init", body: "", headers: []))
    XCTAssertEqual(response.code, 500)
    XCTAssertEqual(response.body, "Hello World")
  }

  func testBasicGet() {
    app.get("/username") { req, _ in
      return (req, Response("swizzlr"))
    }
    XCTAssertEqual(app.app(request: Request("GET", "/username")).body, "swizzlr")
  }

  func testTitanEcho() {
    app.get("/echoMyBody") { req, _ in
      return (req, Response(req.body))
    }
    XCTAssertEqual(app.app(request: Request("GET", "/echoMyBody", "hello, this is my body")).body,
                   "hello, this is my body")
  }

  func testMultipleRoutes() {
    app.get("/username") { req, _ in
      return (req, Response("swizzlr"))
    }

    app.get("/echoMyBody") { req, _ in
      return (req, Response(req.body))
    }
    XCTAssertEqual(app.app(request: Request("GET", "/echoMyBody", "hello, this is my body")).body,
                   "hello, this is my body")
    XCTAssertEqual(app.app(request: Request("GET", "/username")).body, "swizzlr")
  }

  func testTitanSugar() {
    let somePremadeFunction: Function = { req, res in
      return (req, res)
    }
    app.get(path: "/username", handler: somePremadeFunction)
    app.get("/username", somePremadeFunction)
  }

  func testMiddlewareFunction() {
    var start = Date()
    var end = start
    app.addFunction("*") { (req: RequestType, res: ResponseType) -> (RequestType, ResponseType) in
      start = Date()
      return (req, res)
    }
    app.get("/username") { req, _ in
      return (req, Response("swizzlr"))
    }
    app.addFunction("*") { (req: RequestType, res: ResponseType) -> (RequestType, ResponseType) in
      end = Date()
      return (req, res)
    }
    _ = app.app(request: Request("GET", "/username"))
    XCTAssertLessThan(start, end)
  }

  func testDifferentMethods() {
    app.get("/getSomething") { req, _ in
      return (req, Response("swizzlrGotSomething!"))
    }

    app.post("/postSomething") { req, _ in
      return (req, Response("something posted"))
    }

    app.put("/putSomething") { req, _ in
      return (req, Response( "i can confirm that stupid stuff is now on the server"))
    }

    app.patch("/patchSomething") { req, _ in
      return (req, Response("i guess we don't have a flat tire anymore?"))
    }

    app.delete("/deleteSomething") { req, _ in
      return (req, Response("error: could not find the USA or its principles"))
    }

    app.options("/optionSomething") { req, _ in
      return (req, Response("I sold movie rights!"))
    }

    app.head("/headSomething") { req, _ in
      return (req, Response("OWN GOAL!!"))
    }

  }

  func testSamePathDifferentiationByMethod() {
    var username = ""
    let created = Response(201, "")
    app.get("/username") { req, _ in
      return (req, Response(username))
    }
    app.post("/username") { (req: RequestType, _) in
      username = req.body
      return (req, created)
    }

    let resp = app.app(request: Request("POST", "/username", "Lisa"))
    XCTAssertEqual(resp.code, 201)
    XCTAssertEqual(app.app(request: Request("GET", "/username")).body, "Lisa")
  }

  func testMatchingWildcardComponents() {
    app.get("/foo/*/baz/*/bar") { req, res in
      return (req, Response(200, ""))
    }
    let resp = app.app(request: Request("GET", "/foo/123456/baz/7890/bar"))
    XCTAssertEqual(resp.code, 200)
  }

  func testTypesafePathParams() {
    app.get("/foo/*/baz") { req, id, res in
      return (req, Response(id))
    }
    let resp = app.app(request: Request("GET", "/foo/567/baz"))
    XCTAssertEqual(resp.body, "567")
  }

  func testTypesafeMultipleParams() {
    app.get("/foo/*/bar/*/baz/*/qux/*/yex/*") { req, foo, bar, baz, qux, yex, res in
      return (req, Response("foo=\(foo), bar=\(bar), baz=\(baz), qux=\(qux), yex=\(yex)"))
    }
    let resp = app.app(request: Request("GET", "/foo/hello/bar/world/baz/my/qux/name/yex/is"))
    XCTAssertEqual(resp.body, "foo=hello, bar=world, baz=my, qux=name, yex=is")
  }

  func testMismatchingLongPaths() {
    app.get("/foo/*/thing") { req, res in
      return (req, Response(200, "Got foo"))
    }
    let resp = app.app(request: Request("GET", "/foo/bar"))
    XCTAssertNotEqual(resp.body, "Got foo")
  }

  func testMatchingWithAQuery() {
    app.get("/test/hello") { req, res in
      return (req, Response(200))
    }
    let resp = app.app(request: Request("GET", "/test/hello?query=thing&q=2"))
    XCTAssertEqual(resp.code, 200)
  }
}
