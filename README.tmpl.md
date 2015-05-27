# tmpl-cli [![npm version](https://badge.fury.io/js/tmpl-cli.svg)](https://www.npmjs.com/package/tmpl-cli)

> Simple, pipeable template rendering on the command-line

Consumes a JSON object from stdin and makes its properties available in a
template. Prints rendered template to stdout.

Assuming a template `README.tmpl.md`:

```markdown
# Hello world

My username is {\\{name}\\}
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
{{usage}}
```
