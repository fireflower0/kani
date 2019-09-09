# lisp-gui-editor

Editor for easily creating GUI applications in Common Lisp

# Description

Supports GUI application development using Common Lisp and GTK3

# Requirement

* [GTK](https://www.gtk.org/)
* [Roswell](https://github.com/roswell/roswell)
* [Qlot](https://github.com/fukamachi/qlot)

# Preparation

### Install GTK3

```
$ sudo apt install libgtk-3-dev
```

## Install Roswell

Install with reference to [here](https://github.com/roswell/roswell#installation-dependency--usage)

# Usage

## Make project

```
lisp-gui-editor new <project name>
```

## Edit program

Edit `app.lisp`

## Run program

Run REPL `M-x slime-qlot-exec`

```
(ql:quickload :<project name>)
(<project name>:start)
```

# Author

fireflower0

# License

MIT
