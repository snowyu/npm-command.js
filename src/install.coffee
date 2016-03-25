async     = require './install-async'
try sync  = require './install-sync'
config    = require './config'

module.exports = install = (aNames, aOptions, done)->async(aNames, aOptions, done)
install.sync = sync if sync
install.config = config
