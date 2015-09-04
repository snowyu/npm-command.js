isFunction      = require 'util-ex/lib/is/type/function'
isArray         = require 'util-ex/lib/is/type/array'
npmCommand      = require './'
config          = require './config'

module.exports  = install = (aNames, aOptions, done)->
  if isFunction aOptions
    done = aOptions
    aOptions = {}
  config.set aOptions, (err)->
    return done(err) if err
    aNames = [aNames] unless isArray aNames
    npmCommand 'install', [aNames], done
