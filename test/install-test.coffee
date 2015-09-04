chai            = require 'chai'
sinon           = require 'sinon'
sinonChai       = require 'sinon-chai'
should          = chai.should()
expect          = chai.expect
assert          = chai.assert
chai.use(sinonChai)

setImmediate    = setImmediate || process.nextTick

fs              = require 'fs'
deasync         = require 'deasync'
install         = require '../src/install'
command         = deasync require '../src/'


describe 'npm install', ->
  afterEach ->
    command 'uninstall', 'xtend'
    expect(fs.existsSync('./node_modules/xtend')).be.false
  describe 'sync', ->
    it 'should npm install a packages', ->
      result = install.sync 'xtend', silent:true
      expect(result).have.length 1
      expect(result[0]).have.length.at.least 3
      expect(result[0][1]).be.equal 'node_modules/xtend'
      expect(fs.existsSync('./node_modules/xtend')).be.true
  describe 'async', ->
    it 'should npm install a packages', (done)->
      install 'xtend', silent:true, (err, result)->
        unless err
          expect(result).have.length 1
          expect(result[0]).have.length.at.least 3
          expect(result[0][1]).be.equal 'node_modules/xtend'
          expect(fs.existsSync('./node_modules/xtend')).be.true
        done(err)
