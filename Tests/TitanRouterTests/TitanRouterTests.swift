import XCTest
import TitanRouter
import TitanCore

final class TitanRouterTests: XCTestCase {
  var app: Titan!
  override func setUp() {
    app = Titan()
  }
  func testBasicGet() {
    app.get("/username") {
      return "swizzlr"
    }
    XCTAssertEqual(app.app(request: Request("GET", "/username")).body, "swizzlr")
  }

  func testTitanEcho() {
    app.get("/echoMyBody") { req in
      return req.body
    }
    XCTAssertEqual(app.app(request: Request("GET", "/echoMyBody", "hello, this is my body")).body,
                   "hello, this is my body")
  }

  func testMultipleRoutes() {
    app.get("/username") {
      return "swizzlr"
    }

    app.get("/echoMyBody") { req in
      return req.body
    }
    XCTAssertEqual(app.app(request: Request("GET", "/echoMyBody", "hello, this is my body")).body,
                   "hello, this is my body")
    XCTAssertEqual(app.app(request: Request("GET", "/username")).body, "swizzlr")
  }

  func testTitanSugar() {
    let somePremadeMiddleware: Middleware = { req, res in
      return (req, res)
    }
    app.get(path: "/username", handler: somePremadeMiddleware)
    app.get("/username", somePremadeMiddleware)
  }

  func testMiddlewareFunction() {
    var start = Date()
    var end = start
    app.middleware("*") {
      start = Date()
    }
    app.get("/username") {
      return "swizzlr"
    }
    app.middleware("*") {
      end = Date()
    }
    _ = app.app(request: Request("GET", "/username"))
    XCTAssertNotEqual(start, end)
  }

  func testDifferentMethods() {
    app.get("/getSomething") {
      return "swizzlrGotSomething!"
    }

    app.post("/postSomething") {
      return "something posted"
    }

    app.put("/putSomething") {
      return "i can confirm that stupid stuff is now on the server"
    }

    app.patch("/patchSomething") {
      return "i guess we don't have a flat tire anymore?"
    }

    app.delete("/deleteSomething") {
      return "error: could not find the USA or its principles"
    }

    app.options("/optionSomething") {
      return "I sold movie rights!"
    }

    app.head("/headSomething") {
      return "OWN GOAL!!"
    }

  }

  func testSamePathDifferentiationByMethod() {
    var username = ""

    app.get("/username") {
      return username
    }

    app.post("/username") { (req: RequestType) in
      username = req.body
      return 201
    }

    let resp = app.app(request: Request("POST", "/username", "Lisa"))
    XCTAssertEqual(resp.code, 201)
    XCTAssertEqual(app.app(request: Request("GET", "/username")).body, "Lisa")
  }
}
