import XCTest
import TitanRouter
import TitanCore

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
    let somePremadeFunction: Function = { req, res in
      return (req, res)
    }
    app.get(path: "/username", handler: somePremadeFunction)
    app.get("/username", somePremadeFunction)
  }

  func testMiddlewareFunction() {
    var start = Date()
    var end = start
    app.addFunction("*") {
      start = Date()
    }
    app.get("/username") {
      return "swizzlr"
    }
    app.addFunction("*") {
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

    app.post("/username") { (req: RequestType) -> Int in
      username = req.body
      return 201
    }

    let resp = app.app(request: Request("POST", "/username", "Lisa"))
    XCTAssertEqual(resp.code, 201)
    XCTAssertEqual(app.app(request: Request("GET", "/username")).body, "Lisa")
  }
}
