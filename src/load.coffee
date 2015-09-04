isFunction        = require 'util-ex/lib/is/type/function'
npm               = require 'npm'
try deasync       = require 'deasync'

#the npm commd queue to execute
# each item is a plain object:
# command: 'install'
# arguments: ...
commandQueue      = []
#the npm is loaded?
loaded            = false

runCommand = (aCommand, aArguments, self)->
  if !isFunction aCommand
    aCommand = npm.commands[aCommand]
  self ?= npm
  if aArguments
    switch aArguments.length
      when 2
        aCommand.call self, aArguments[0], aArguments[1]
      when 1
        aCommand.call self, aArguments[0]
      when 3
        aCommand.call self, aArguments[0], aArguments[1], aArguments[2]
      else
        aCommand.apply self, aArguments
  else # no callback, it should be an error?
    aCommand.call self

npm.load (err, npm)->
  throw err if err
  loaded = true
  if commandQueue.length
    vQueue = commandQueue
    commandQueue = []
    for i in vQueue
      runCommand i.command, i.arguments
if deasync
  # wait until loaded
  deasync.loopWhile ->!loaded

# return true if npm loaded
# else return false and add the aCommand to the queue if aCommand and aArguments both exists
module.exports = npmLoad = (aCommand, aArguments, aSelf)->
  result = loaded
  if !result and arguments.length >= 2
    vCmd = command:aCommand, arguments:aArguments
    vCmd.self = aSelf if aSelf
    commandQueue.push vCmd
  result
