deasync         = require 'deasync'
isFunction      = require 'util-ex/lib/is/type/function'
isArray         = require 'util-ex/lib/is/type/array'
npmCommand      = deasync require './'
config          = require './config'

module.exports  = (aNames, aOptions)->
  if isFunction aOptions
    done = aOptions
    aOptions = {}
  config.setSync aOptions
  aNames = [aNames] unless isArray aNames
  npmCommand 'install', [aNames]
