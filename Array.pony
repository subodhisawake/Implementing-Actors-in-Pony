actor ArrayCreator
    let _worker: Worker

    new create(worker: Worker)=>
        _worker = worker

    be buildArray(b: U32)=>
        let arr: Array[U32] iso = Array[U32]
        var i: U32 = 1
        while (i <= b) do
            arr.push(i)
            i = i + 1
        end
        _worker.array_ready(consume arr)