;----------------------------------------
; customize interface
;----------------------------------------
;; hide some components
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(set-face-attribute 'default nil :height 150)
(set-frame-font "Inconsolata")
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Heiti SC" :size 15)))

(load-theme 'zenburn t)
