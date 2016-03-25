path            = require 'path'
chai            = require 'chai'
sinon           = require 'sinon'
sinonChai       = require 'sinon-chai'
should          = chai.should()
expect          = chai.expect
assert          = chai.assert
chai.use(sinonChai)

setImmediate    = setImmediate || process.nextTick

fs              = require 'fs'
try deasync     = require 'deasync'
install         = require '../src/install'
uninstall       = require '../src/uninstall'
command         = require '../src/'
if deasync
  command       = deasync command



describe 'npm install', ->
  afterEach (done)->
    uninstall 'xtend', (err, result)->
      expect(fs.existsSync('./node_modules/xtend')).be.false
      done(err)
  if deasync
    describe 'sync', ->
      it 'should npm install a packages', ->
        result = install.sync 'xtend', silent:true
        expect(result).have.length 1
        expect(result[0]).have.length.at.least 2
        expect(result[0][1]).be.equal path.join 'node_modules', 'xtend'
        expect(fs.existsSync('./node_modules/xtend')).be.true
  describe 'async', ->
    it 'should npm install a packages', (done)->
      install 'xtend', silent:true, (err, result)->
        unless err
          console.log result
          expect(result).have.length 1
          expect(result[0]).have.length.at.least 2
          expect(result[0][1]).be.include path.join 'node_modules', 'xtend'
          expect(fs.existsSync('./node_modules/xtend')).be.true
        done(err)
describe 'npm uninstall', ->
  beforeEach (done)->
    install 'xtend', silent:true, (err, result)->
      done(err)
  describe 'async', ->
    it 'should npm uninstall a packages', (done)->
      uninstall 'xtend', silent:true, (err, result)->
        unless err
          expect(fs.existsSync('./node_modules/xtend')).be.false
        done(err)
  if deasync
    describe 'sync', ->
      it 'should npm uninstall a packages', ->
        result = uninstall.sync 'xtend', silent:true
        expect(fs.existsSync('./node_modules/xtend')).be.false
