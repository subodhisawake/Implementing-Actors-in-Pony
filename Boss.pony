actor Boss
  let _env: Env
  var _pending: USize = 1

  new create(env: Env) =>
    _env = env

  be start() =>
    let worker1 = Worker(this)
    worker1.process(3, 2) // THE INPUT GOES HERE 

  be worker_done(result: U32) =>
    let sqrt_result = result.f64().sqrt()
    if (sqrt_result == sqrt_result.floor()) then
      _env.out.print("Found a square: " + result.string())
      _pending = _pending - 1
    else
      _env.out.print("There was no square here")
    end

    if _pending == 0 then
      _env.out.print("All workers are done!")
    end