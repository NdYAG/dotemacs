(include-packages
 'ag
 'auto-complete
 'deft
 'dirtree
 'expand-region
 'helm
 'helm-css-scss
 'helm-swoop
 'magit
 'multiple-cursors
 'powerline
 'smartscan
 'smartparens
 'yasnippet
 )

;; eye candy
(require 'powerline)
(powerline-default-theme)

(require 'rainbow-mode)

;; auto complete
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
        ))
(yas-global-mode t)
;;(setq yas-extra-modes 'html-mode)

(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)


;; editor enhancement
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'multiple-cursors)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-;") 'mc/edit-lines)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-,") 'mc/mark-all-like-this)

;; (require 'ace-jump-mode)
;; (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;; (define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

(define-key global-map (kbd "C-x SPC") 'cua-mode)

(require 'deft)
(setq deft-directory "~/Dropbox/Notebook")
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(global-set-key [f8] 'deft)

;; (require 'sr-speedbar)
;; (speedbar-add-supported-extension ".css")
;; (speedbar-add-supported-extension ".styl")
;; (speedbar-add-supported-extension ".jade")
;; (speedbar-add-supported-extension ".coffee")
;; (setq speedbar-frame-parameters
;;       '((minibuffer)
;; 	(width . 40)
;; 	(border-width . 0)
;; 	(menu-bar-lines . 0)
;; 	(tool-bar-lines . 0)
;; 	(unsplittable . t)
;; 	(left-fringe . 0)))
;; (setq speedbar-hide-button-brackets-flag t)
;; (setq speedbar-show-unknown-files t)
;; (setq speedbar-smart-directory-expand-flag t)
;; (setq speedbar-use-images nil)
;; (setq sr-speedbar-auto-refresh nil)
;; (setq sr-speedbar-max-width 70)
;; (setq sr-speedbar-right-side nil)
;; (setq sr-speedbar-width-console 40)
;; (global-set-key [f4] 'sr-speedbar-toggle)
(require 'dirtree)
(global-set-key [f4] 'dirtree)

;; (require 'fic-mode)
;; (defun font-lock-comment-annotations ()
;;   (font-lock-add-keywords
;;    nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):"
;;           1 font-lock-warning-face t))))
;; (add-hook 'prog-mode-hook 'font-lock-comment-annotations)

(require 'ag)
(setq ag-highlight-search t)
(global-set-key (kbd "<f5>") 'ag-project)
(global-set-key (kbd "<f6>") 'ag-regexp-project-at-point)

;; bookmark
(autoload 'bm-toggle   "bm" "Toggle bookmark in current buffer." t)
(autoload 'bm-next     "bm" "Goto bookmark."                     t)
(autoload 'bm-previous "bm" "Goto previous bookmark."            t)
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)

;;workgroup
;; (require 'workgroups)
;; (workgroups-mode 1)
;; (setq wg-prefix-key (kbd "C-c w"))

(require 'magit)
(eval-after-load 'info
  '(progn (info-initialize)
          (set-face-foreground 'magit-diff-add "green3")
          (set-face-foreground 'magit-diff-del "red3")
          (add-to-list 'Info-directory-list (concat user-emacs-directory "plugins/magit"))))
(setq magit-diff-refine-hunk 'all)
;;(global-set-key (kbd "<C-c g>") 'magit-status)
(global-set-key "g" (quote magit-status))

;; (require 'markdown-mode)
;; (autoload 'markdown-mode "markdown-mode"
;;    "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;productivity
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)
(require 'helm-css-scss)
(global-set-key "s" (quote helm-css-scss))
(require 'helm-swoop)
(global-set-key (kbd "C-c w") (quote helm-swoop))
(global-set-key (kbd "C-c r") (quote helm-swoop-back-to-last-point))

(require 'smartscan)
(smartscan-mode 1)

(require 'smartparens-config)
(show-smartparens-global-mode +1)
