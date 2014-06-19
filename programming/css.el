(include-packages 'rainbow-mode 'scss-mode 'stylus-mode 'helm-css-scss)

(add-hook 'css-mode-hook 'prog-defaults)
(add-hook 'css-mode-hook 'rainbow-mode)

(defun insert-css-block ()
  (interactive)
  (progn
    (insert "{")
    (newline-and-indent)
    (newline-and-indent)
    (insert "}")
    (indent-for-tab-command)
    (forward-line -1)
    (indent-for-tab-command)))

(eval-after-load 'css-mode
  '(progn
     (define-key css-mode-map (kbd "{") 'insert-css-block)))
     ;; prevent the ac-complete-mode-map "\r" default operation
     ;; see this question: http://stackoverflow.com/questions/4597536/emacs-auto-complete-mode-css-pain-illustrated
     ;; (define-key css-mode-map (kbd ";") '(lambda () (interactive) (progn (insert ";") (newline-and-indent))))))

;; (include-path "language/lang_modes")
(require 'scss-mode)
(setq scss-compile-at-save nil)
(add-hook 'scss-mode-hook (lambda()
                            (add-to-list 'ac-modes 'scss-mode)
                            (auto-complete-mode 1)
                            (hs-minor-mode 1)
                            (local-set-key [C-tab] (quote hs-toggle-hiding))))

(require 'helm-css-scss)
(global-set-key "s" (quote helm-css-scss))

(require 'stylus-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . stylus-mode))
(add-hook 'stylus-mode-hook 'rainbow-mode)
