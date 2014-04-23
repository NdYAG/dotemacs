;----------------------------------------
; customize interface
;----------------------------------------
;; hide some components
(include-packages 'powerline
                  'zenburn-theme
                  'obsidian-theme
                  'solarized-theme)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(set-face-attribute 'default nil :height 150)
(set-frame-font "Inconsolata")
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Heiti SC" :size 15)))

;; (load-theme 'zenburn t)
;; (load-theme 'obsidian t)
(load-theme 'solarized-dark t)

;; eye candy
(require 'powerline)
(powerline-vim-theme)
