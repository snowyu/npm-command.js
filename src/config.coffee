npm             = require 'npm'
loaded          = require './load'
lastCongfigs    = {}

_get = (key, done)->
  try
    result = npm.config.get key
  catch err
  done(err, result)
  return
_set = (aObject, done)->
  try
    for key, value of aObject
      npm.config.set key, value
      lastCongfigs[key]=value
  catch err
  done(err)
  return
_del = (key, done)->
  try
    result = npm.config.del key
    delete lastConfigs[key]
  catch err
  done(err, result)
  return
_clear = (done)->
  try
    for key of lastConfigs
      npm.config.del key
    lastConfigs = {}
  catch err
  done(err)
  return

module.exports  =
  get: (key, done)->
    if loaded _get, [key, done]
      _get key, done
    return
  getSync: (key)->
    throw new Error('npm not loaded') unless loaded()
    npm.config.get key
  set: (aObject, done)->
    if loaded _set, [aObject, done]
      _set aObject, done
    return
  setSync: (aObject)->
    throw new Error('npm not loaded') unless loaded()
    for key, value of aObject
      npm.config.set key, value
      lastCongfigs[key]=value
    return
  del: (key, done)->
    if loaded _del, [key, done]
      _del key, done
    return
  delSync: (key)->
    throw new Error('npm not loaded') unless loaded()
    npm.config.del key
    delete lastConfigs[key]
  clear: ->
    if loaded _clear, [done]
      _clear done
    return
  clearSync: ->
    throw new Error('npm not loaded') unless loaded()
    for key of lastConfigs
      npm.config.del key
    lastConfigs = {}
