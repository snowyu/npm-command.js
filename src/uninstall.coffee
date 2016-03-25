async     = require './uninstall-async'
try sync  = require './uninstall-sync'
config    = require './config'

module.exports = uninstall = (aNames, aOptions, done)->async(aNames, aOptions, done)
uninstall.sync = sync if sync
uninstall.config = config
