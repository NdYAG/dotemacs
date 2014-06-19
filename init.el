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
	 "ruby"
	 ))
(include "plugins/")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector ["#e9e2cb" "#c60007" "#728a05" "#a57705" "#2075c7" "#c61b6e" "#259185" "#708183"])
 '(ansi-term-color-vector [unspecified "#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#6c71c4" "#268bd2" "#eee8d5"])
 '(background-color "#fcf4dc")
 '(background-mode light)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-color "#52676f")
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes (quote ("c3fb7a13857e799bba450bb81b9101ef4960281c4d5908e05ecac9204c526c8a" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "2affb26fb9a1b9325f05f4233d08ccbba7ec6e0c99c64681895219f964aac7af" "4eaad15465961fd26ef9eef3bee2f630a71d8a4b5b0a588dc851135302f69b16" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "de2c46ed1752b0d0423cde9b6401062b67a6a1300c068d5d7f67725adc6c3afb" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(fci-rule-color "#e9e2cb")
 '(foreground-color "#52676f")
 '(global-linum-mode t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors (quote (("#eee8d5" . 0) ("#B4C342" . 20) ("#69CABF" . 30) ("#69B7F0" . 50) ("#DEB542" . 60) ("#F2804F" . 70) ("#F771AC" . 85) ("#eee8d5" . 100))))
 '(magit-use-overlays nil)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#c60007") (40 . "#bd3612") (60 . "#a57705") (80 . "#728a05") (100 . "#259185") (120 . "#2075c7") (140 . "#c61b6e") (160 . "#5859b7") (180 . "#c60007") (200 . "#bd3612") (220 . "#a57705") (240 . "#728a05") (260 . "#259185") (280 . "#2075c7") (300 . "#c61b6e") (320 . "#5859b7") (340 . "#c60007") (360 . "#bd3612"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list (quote (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
