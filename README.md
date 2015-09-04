## npm-command [![npm](https://img.shields.io/npm/v/npm-command.svg)](https://npmjs.org/package/npm-command)

[![Build Status](https://img.shields.io/travis/snowyu/npm-command.js/master.svg)](http://travis-ci.org/snowyu/npm-command.js)
[![Code Climate](https://codeclimate.com/github/snowyu/npm-command.js/badges/gpa.svg)](https://codeclimate.com/github/snowyu/npm-command.js)
[![Test Coverage](https://codeclimate.com/github/snowyu/npm-command.js/badges/coverage.svg)](https://codeclimate.com/github/snowyu/npm-command.js/coverage)
[![downloads](https://img.shields.io/npm/dm/npm-command.svg)](https://npmjs.org/package/npm-command)
[![license](https://img.shields.io/npm/l/npm-command.svg)](https://npmjs.org/package/npm-command)


Execute npm commands programmly with synchronously or asynchronously.

## Usage

```coffee
command  = require 'npm-command'
install  = require 'npm-command/lib/install'
config   = require 'npm-command/lib/config'

#install 'aNpmPackageName', {save:true}, (err, data)->
config.set save:true, (err)->
  unless err
    command 'install', ['aPackageName'], (err,data)->

install.sync 'aNpmPackageName', {save:true}

```

## API


## TODO


## License

MIT
