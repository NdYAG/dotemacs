;----------------------------------------
; dired mode enhancement
;----------------------------------------
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
;; borrow from http://ann77.emacser.com/Emacs/EmacsDiredExt.html
;; and slightly modified to my shell alias style link "ls" "lx" "lt"
(add-hook 'dired-mode-hook (lambda ()
  (interactive)
  (make-local-variable  'dired-sort-map)
  (setq dired-sort-map (make-sparse-keymap))
  (setq header-line-format "Sort by: Time(lt), Size(lk), Extension(lx), Name(ls)")
  (define-key dired-mode-map "l" dired-sort-map)
  (define-key dired-sort-map "k"
    '(lambda () "sort by Size"
       (interactive) (dired-sort-other (concat dired-listing-switches "S"))))
  (define-key dired-sort-map "x"
    '(lambda () "sort by eXtension"
       (interactive) (dired-sort-other (concat dired-listing-switches "X"))))
  (define-key dired-sort-map "t"
    '(lambda () "sort by Time"
       (interactive) (dired-sort-other (concat dired-listing-switches "t"))))
  (define-key dired-sort-map "s"
    '(lambda () "sort by Name"
       (interactive) (dired-sort-other (concat dired-listing-switches ""))))))

(defun dired-sort ()
  "Dired sort hook to list directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
  (and (featurep 'xemacs)
       (fboundp 'dired-insert-set-properties)
       (dired-insert-set-properties (point-min) (point-max)))
  (set-buffer-modified-p nil))
(add-hook 'dired-after-readin-hook 'dired-sort)

;; http://www.emacswiki.org/emacs/KillingBuffers#toc3
(defun kill-all-dired-buffers()
  "Kill all dired buffers."
  (interactive)
  (save-excursion
    (let((count 0))
      (dolist(buffer (buffer-list))
	(set-buffer buffer)
	(when (equal major-mode 'dired-mode)
	  (setq count (1+ count))
	  (kill-buffer buffer)))
      (message "Killed %i dired buffer(s)." count ))))
