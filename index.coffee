packageJson = require './package.json'
commander = require 'commander'
chokidar = require 'chokidar'

commander
.version packageJson.version
.usage '[options]'
.option '-d, --directory [value]', 'set the watch directory', '.'
.option '-c, --count <n>', 'set num of alert in interval', parseInt, 3
.option '-i, --interval <n>', 'set seconds alert interval', parseInt, 30
.option '-a, --apikey [value]', 'set the api key of pushbullet', ''
.parse process.argv

console.log commander.directory

chokidar.watch commander.directory,
  ignoreInitial: true
.on 'all', (event, path) ->
  console.log event, path