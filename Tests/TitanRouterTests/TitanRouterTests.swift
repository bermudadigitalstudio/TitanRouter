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
  func testMutableParams() {
    let app = Titan()
    app.get("/init") { (req, res) -> Void in
      res.body = "Hello World"
      req.path = "/rewritten"
      res.code = 500
    }
    app.addFunction { (req, res) -> (RequestType, ResponseType) in
      XCTAssertEqual(req.path, "/rewritten")
      return (req, res)
    }
    let response = app.app(request: Request("GET", "/init"))
    XCTAssertEqual(response.code, 500)
    XCTAssertEqual(response.body, "Hello World")
  }

  func testFunctionalMutableParams() {
    let app = Titan()
    app.get("/init") { (req: inout Request, res: inout Response) -> (RequestType, ResponseType) in
      var newReq = req
      var newRes = res
      newRes.body = "Hello World"
      newReq.path = "/rewritten"
      newRes.code = 500
      // Check that mutating the inout params has no effect on the function chain – ONLY the returned values should matter
      res.code = 400
      res.body = "Should not ever come into the response"
      return (newReq, newRes)
    }
    app.addFunction { (req, res) -> (RequestType, ResponseType) in
      XCTAssertEqual(req.path, "/rewritten")
      return (req, res)
    }
    let response = app.app(request: Request("GET", "/init"))
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
    app.get(pathTemplate: "/foo/*/baz") { req, id, res in
      return (req, Response(id))
    }
    let resp = app.app(request: Request("GET", "/foo/567/baz"))
    XCTAssertEqual(resp.body, "567")
  }
}
