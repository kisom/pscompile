## pscompile

`pscompile` is a [parenscript](http://common-lisp.net/project/parenscript/)
to JavaScript transcompiler. It provides a way to write javascript in a
Lisp-like syntax.

## Building

Right now, there is only support for SBCL; adding a new compiler that supports
POSIX command line options should be trivial.

```
sbcl --load build.lisp
```

will build the `pscompile` binary in the current directory.

## Using

```
pscompile [parenscript files]
```

The files will be saved under the same base file name, with the extension ".js".
For example, `test.lps` will be saved as `test.js`.

## License

```
Copyright (c) 2013 Kyle Isom <coder@kyleisom.net>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above 
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE. 
```
