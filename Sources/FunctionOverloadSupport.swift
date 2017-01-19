import TitanCore

// Mutable variants

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
