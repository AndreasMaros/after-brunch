sysPath = require 'path'
{exec}  = require 'child_process'

module.exports = class AfterBrunch
  brunchPlugin: yes

  constructor: (@config) ->
    @conf = @config.plugins.afterBrunch ? {}
    @commands = @conf.commands ? []

  onCompile: (generatedFiles) ->
    po = @conf.productionOnly ? false
    doRun = po ? process.env.NODE_ENV === 'production' : true
    if (doRun)
      for command in @commands
        exec command, (error, stdout, stderr) ->
          console.log stdout if stdout
          console.log error.message if error
          console.log stderr if stderr

    return
