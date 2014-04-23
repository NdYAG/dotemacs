(add-to-list 'load-path user-emacs-directory)
(byte-recompile-directory user-emacs-directory)

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(require 'include)
(include "init/")
(include "programming/"
 '(
	 "programming"
	 "html" ;; web-mode
	 "css" ;; include css/scss/stylus modes
	 "js" ;; js3-mode
	 ;; "markdown"
	 ;; "jade"
	 ;; "coffee"
	 "python"
	 ))
(include "plugins/")
