use "collections"
actor Worker
  let _boss: Boss
  var _a: U32 = 0
  var _b: U32 = 0

  new create(boss: Boss) =>
    _boss = boss

  be process(a: U32, b: U32) =>
    _a = a
    _b = b
    let array_builder = ArrayCreator(this)
    array_builder.buildArray(b)
  
  be array_ready(arr: Array[U32] iso) =>
    let iterator = SlideWindows(this, _a)
    iterator.process(consume arr)
  
  be worker_done(result: U32) =>
    _boss.worker_done(result)