import TitanCore

internal func toFunction(_ handler: @escaping () -> String) -> Function {
  return { req, res in
    return (req, Response(200, handler()))
  }
}
internal func toFunction(_ handler: @escaping (RequestType) -> String) -> Function {
  return { req, res in
    return (req, Response(200, handler(req)))
  }
}

internal func toFunction(_ handler: @escaping () -> Void) -> Function {
  return { req, res in
    handler()
    return (req, res)
  }
}

internal func toFunction(_ handler: @escaping (RequestType) -> Int) -> Function {
  return { req, res in
    return (req, Response(handler(req), ""))
  }
}

internal func toFunction(_ function: @escaping (inout Request, inout Response) -> (RequestType, ResponseType)) -> Function {
  return { req, res in
    var mutRequest = Request(req.method, req.path, req.body, headers: req.headers)
    var mutResponse = Response(res.code, res.body, headers: res.headers)
    return function(&mutRequest, &mutResponse)
  }
}

internal func toFunction(_ function: @escaping (inout Request, inout Response) -> Void) -> Function {
  return { req, res in
    var mutRequest = Request(req.method, req.path, req.body, headers: req.headers)
    var mutResponse = Response(res.code, res.body, headers: res.headers)
    function(&mutRequest, &mutResponse)
    return (mutRequest, mutResponse)
  }
}
