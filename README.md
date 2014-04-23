# dotemacs

Use a lightweight loader and Emacs builtin package manager( or git submodule, but deprecated) to organize packages.

## include.el
`include.el` is a lightweight loader to organize and compile your `.el` files.

### include

`(include "dir/")` loads every `.el` file in `dir/` directory.

`(include "dir/" '(el1 el2))` loads spefic files (`el1.el`, `el2.el` in this case) in `dir/` directory

`include` compiles `.el` files to `.elc` if `.el` is new and loads `.elc` next time.

An use case:

```elisp
;; .emacs
(include "init/")
(include "language/"
 '(
   "lang_programming"
   "lang_html"
   "lang_css"
   "lang_js"
   "lang_nodejs"
   "lang_coffee"
   ;; todo
   ;; "lang_python"
   ))
(include "plugins/")
```

### include-packages (new)

`(include-packages 'plugin-a 'plugin-b)`, will check packages listed and install the missed automatically.

### include-path (for manually usage, deprecated)

`(include-path "dir/")` adds `dir/` and it's subdirectories to `load-path`

In above case,

`(include "language/" '("lang_programming"))` loads file `language/lang_programming.el(c)`.

Now in `language/lang_programming.el`, we add all language modes to `load-path` by adding this line

```elisp
(include-path "language/lang_modes")
;; configuration for language modes
```

## git submodule

To install a new package, use `git submodule` to download a copy and place it into the spefic directory we included, such as `language/lang_modes`:

`git submodule add https://github.com/fxbois/web-mode.git language/lang_modes/web-mode`

* `git submodule update` to update packages.
* `cd [gitsubmodule], git pull origin master` to update a package.
* `git submodule update --init --recursive` to initiate and update all packages.