# tmpl-cli [![npm version](https://badge.fury.io/js/tmpl-cli.svg)](https://www.npmjs.com/package/tmpl-cli)

> Simple, pipeable template rendering on the command-line

Consumes a JSON object from stdin and makes its properties available in a
template.

Prints rendered template to stdout.

Assuming a template `README.tmpl.md`:

```markdown
# Hello world

My username is {{name}}
```

```sh
$ echo '{ "name": "raine" }' | tmpl README.tmpl.md
```

```markdown
# Hello world

My username is raine!
```

## install

```sh
npm install -g tmpl-cli
```

## usage

```
Usage: tmpl <path-to-template>

Example:
  cat data.json | tmpl README.tmpl.md > README.md
```

## more

Use [`ramda-cli`](https://github.com/raine/ramda-cli) to process data for a template:

```markdown
#### My project's dependencies

{{deps}}
```

```sh
npm ls --json --depth 0 --prod | R \
  '.dependencies' 'map-obj (.version)' to-pairs 'map zip-obj [\package, \version]' \
  'map evolve package: -> "[`#it`](https://www.npmjs.com/package/#it)"' \
  | md-table \
  | R -i raw --slurp 'join \\n' '-> deps: it' \
  | tmpl doc.tmpl.md
```

### output

#### My project's dependencies

| package                                                            | version |
| ------------------------------------------------------------------ | ------- |
| [`JSONStream`](https://www.npmjs.com/package/JSONStream)           | 1.0.4   |
| [`lodash.template`](https://www.npmjs.com/package/lodash.template) | 3.6.1   |
| [`minimist`](https://www.npmjs.com/package/minimist)               | 1.1.1   |
| [`through2-map`](https://www.npmjs.com/package/through2-map)       | 1.4.0   |
