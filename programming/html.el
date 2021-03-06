(include-packages 'zencoding-mode 'web-mode)

(require 'zencoding-mode)
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mako\\'" . web-mode))
(add-to-list 'auto-mode-alist
'("/\\(views\\|html\\|theme\\|templates\\)/.*\\.php\\'" . web-mode))

;; (defun open-with-mako()
;;   (when (string-match "/ssh" buffer-file-name)
;;     (web-mode-set-engine "mako")))
(defun open-with-mako()
    (web-mode-set-engine "mako"))
(add-hook 'web-mode-hook 'open-with-mako)
(add-hook 'web-mode-hook
          (lambda() (local-set-key [C-tab] (quote web-mode-fold-or-unfold))))

;; (defun font-lock-setup ()
  ;; (when (equal major-mode 'web-mode) (setq font-lock-mode nil)))
;; (add-hook 'font-lock-mode-hook 'font-lock-setup)

(defun web-mode-hook ()
  "Hooks for Web mode."
  (auto-complete-mode t)
  (setq web-mode-disable-auto-pairing t)
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-indent-style 4)
  (setq web-mode-style-padding 2)
  (setq web-mode-script-padding 2)
)
(add-hook 'web-mode-hook  'web-mode-hook)
(add-hook 'web-mode-hook  'zencoding-mode)
(add-hook 'web-mode-hook  'prog-defaults)
