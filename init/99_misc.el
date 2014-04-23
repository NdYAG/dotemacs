;;----------------------------------------
;; 99_misc.el
;; setup sandbox
;;----------------------------------------
(require 'ido)
(ido-mode +1)

(setq tags-table-list '(concat user-emacs-directory "TAGS"))

(add-hook 'find-file-hook 'smerge-start-session)

(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))
(add-hook 'text-mode-hook 'remove-dos-eol)
