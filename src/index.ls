require! {JSONStream, minimist, fs, path}
require! 'lodash.template': compile-template
require! 'through2-map'

TEMPLATE_OPTS = interpolate: /{{([\s\S]+?)}}/g

die = console.error >> process.exit
print-usage = ->
    fs.create-read-stream path.join __dirname, '../bin/usage.txt'
        .pipe process.stdout

argv = minimist (process.argv.slice 2), alias: {h: \help}
if argv.help or not argv._.0 then return print-usage!

tmpl-path = argv._.0
read-file = fs.read-file-sync _, encoding: \utf-8
compile-template-file = read-file >> (compile-template _, TEMPLATE_OPTS)

try render = compile-template-file tmpl-path
catch {message} then die message

render-stream = through2-map.obj ->
    try render it catch {message} then die "Error while rendering: #message"

process.stdin
    .pipe JSONStream.parse!
    .pipe render-stream
    .pipe process.stdout
