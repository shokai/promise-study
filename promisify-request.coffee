Promise = require 'bluebird'
request = Promise.promisify require 'request'

request 'http://shokai.org'
.then (res) ->
  console.log res
.catch (err) ->
  console.error err
