isFunction        = require 'util-ex/lib/is/type/function'
isArray           = require 'util-ex/lib/is/type/array'
npm               = require 'npm'
load              = require './load'

lastConfigs       = null

module.exports = (aCommand, aArguments, done)->
  if isFunction aArguments
    done = aArguments
    aArguments = [done]
  else if aArguments
    if not isArray aArguments
      aArguments = [aArguments]
    aArguments.push done
  else
    aArguments = [done]
  if load aCommand, aArguments
    if aArguments
      switch aArguments.length
        when 2
          npm.commands[aCommand] aArguments[0], aArguments[1]
        when 1
          npm.commands[aCommand] aArguments[0]
        else
          npm.commands[aCommand].apply npm, aArguments

  return