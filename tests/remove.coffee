vows = require "vows"
assert = require "assert"
trie = require "../trie"
fs = require "fs"
_ = require "underscore"
suite = vows.describe "Find countries"

findTest = (trie, query, expected) ->
  result = trie.find query
  assert.equal result, expected
  
  
###
  Test should go here...
###

# ...

###
  END
###

test = 
  "when searching the trie..." :
    topic : () ->
      countries = require("./fixtures/countries.js");
      return trie(countries)
      
expectedFuncs = {}

for query, expected of tests
  do (query, expected) ->
    key = '"' + query + '" --> "' + expected + '"'
    expectedFuncs[key] = (trie) ->
      findTest trie, query, expected 

_.extend test["when searching the trie..."], expectedFuncs

# Add the test to the batch
suite.addBatch test

# Export the suite
suite.export module