actor SlideWindows
  let _worker: Worker
  let _a: U32

  new create(worker: Worker, a: U32) =>
    _worker = worker
    _a = a

  be process(arr: Array[U32] iso) => // same name (method overloading)
    var result: U32 = 0
    var sqrt_result: F64 = 0.0
    var b: U32 = arr.size().u32()
    var current_arr = consume arr  
    try
      while (current_arr(0)? != (_a + 1)) do
        result = 0

        let size: USize = current_arr.size()
        var i: USize = 0
        while i < size do
          let nums = current_arr(i)?  
          result = result + (nums * nums)
          i = i + 1
        end

        sqrt_result = result.f64().sqrt()
        if sqrt_result == sqrt_result.floor() then
          _worker.worker_done(result)
          return
        else
          current_arr.remove(0, 1)
          current_arr.push(b + 1)
          b = b + 1
        end
      end
      _worker.worker_done(result)
    end

