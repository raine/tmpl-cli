# tmpl-cli [![npm version](https://badge.fury.io/js/tmpl-cli.svg)](https://www.npmjs.com/package/tmpl-cli)

> Simple, pipeable template rendering on the command-line

Consumes a JSON object from stdin and makes its properties available in a
template.

Prints rendered template to stdout.

Assuming a template `README.tmpl.md`:

```markdown
# {{name}}

> {{description}}

Version: {{version}}
```

```sh
$ cat package.json | tmpl README.tmpl.md
```

```markdown
# tmpl-cli

> Simple, pipeable template rendering on the command-line

Version: 0.1.2
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

## example

Let's say you have a list of your module's dependencies in
[`deps.json`][deps.json] and want to create a markdown table out of it and
include it in markdown file `deps.md`.

Here's your template, `deps.tmpl.md`:

```markdown
#### My project's dependencies

{{deps}}
```

We use [`markdown-table-cli`][markdown-table-cli] to format it into a table,
and [`ramda-cli`][ramda-cli] to wrap the table in JSON:

```sh
cat deps.json \
  | md-table \
  | R -i raw --slurp unlines 'create-map-entry \deps' \
  | tmpl deps.tmpl.md
```

### output

#### My project's dependencies

| package         | version |
| --------------- | ------- |
| JSONStream      | 1.0.4   |
| lodash.template | 3.6.1   |
| minimist        | 1.1.1   |
| through2-map    | 1.4.0   |

[markdown-table-cli]: https://github.com/raine/markdown-table-cli
[deps.json]: https://gist.github.com/2205112af80b094bdc00
[ramda-cli]: https://github.com/raine/ramda-cli
