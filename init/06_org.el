;----------------------------------------
; org-mode setup, mostly borrowed from
; http://doc.norang.ca/org-mode.html
; and
; http://orgmode.org/worg/ (really great resource)
;----------------------------------------
(include-packages 'htmlize)

(eval-when-compile
  (require 'org)
  (require 'htmlize))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(eval-after-load 'org-mode
  (progn
					; directory
    (setq org-directory "~/Dropbox/org")
    (setq org-default-notes-file "~/Dropbox/org")
    (setq org-agenda-files (list "~/Dropbox/org"))
					; org setting
    (setq org-src-fontify-natively t)
    (setq org-support-shift-select t)))

; key-binding
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-capture)
(global-set-key [f12] 'org-remember)

; time
(setq org-log-done 'time)
(setq org-log-done 'note)

(add-hook 'org-mode-hook
	  '(lambda ()
	     (make-variable-buffer-local 'truncate-lines)
	     (setq truncate-lines nil)))
;----------------------------------------
; export-settings
; useful for export your blog post
;----------------------------------------
(setq org-export-htmlize-output-type "css")
