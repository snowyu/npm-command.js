async = require './install-async'
sync  = require './install-sync'
config= require './config'

module.exports = install = (aNames, aOptions, done)->async(aNames, aOptions, done)
install.sync = sync
install.config = config
