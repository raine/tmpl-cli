# tmpl-cli

> Simple, pipeable template rendering on the command-line

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
Usage: tmpl <template-path>

Example:
  cat data.json | tmpl README.tmpl.md > README.md
```
