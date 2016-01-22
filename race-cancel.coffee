delay = (msec) ->
  console.log "delay #{msec}(msec)"
  timeout = null
  promise = new Promise (resolve, reject) ->
    timeout = setTimeout ->
      timeout = null
      console.log "delay #{msec}(msec) done"
      return resolve()
    , msec
  promise.cancel = ->
    return unless timeout
    console.log "cancel #{msec} delay"
    clearTimeout timeout
  return promise

arr = [delay(1000), delay(2000)]
Promise.race arr
.then ->
  arr.forEach (promise) -> promise.cancel()
.catch (err) ->
  console.error err.stack or err
