;----------------------------------------
; key binding
; Tips: 1) M-x global-set-key
;       2) C-x Esc Esc
;----------------------------------------
(setq ns-function-modifier 'hyper) ;; set fn as Hyper on Mac

(global-set-key (kbd "<C-mouse-4>") 'text-scale-decrease)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-increase)
(global-set-key [67108907] (quote text-scale-increase))
(global-set-key "" (quote text-scale-decrease))

;; Keybindings
;; window-switch
(global-set-key "p" '(lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
;;window-resize
(global-set-key (kbd "S-C-<left>") '(lambda () (interactive) (shrink-window-horizontally 4)))
(global-set-key (kbd "S-C-<right>") '(lambda () (interactive) (enlarge-window-horizontally 4)))
(global-set-key (kbd "S-C-<down>") '(lambda () (interactive) (shrink-window 4)))
(global-set-key (kbd "S-C-<up>") '(lambda () (interactive) (enlarge-window 4)))


(global-set-key (kbd "C-<tab>") 'hs-toggle-hiding)
(global-set-key "t" (quote insert-date))

;; M-( like keybinding
(global-set-key (kbd "M-[") 'insert-pair)
(global-set-key (kbd "M-\"") 'insert-pair)
;; (global-set-key (kbd "M-{") 'insert-pair)

;----------------------------------------
; shortcut enhancement
; use M-x global-set-key to bind.
; use C-x Esc Esc to repeat.
;----------------------------------------
(defalias 'qrr 'query-replace-regexp)
(defalias 'oc 'occur)
(defalias 'evb 'eval-buffer)
(defalias 'mkdir 'make-directory)
(defalias 'yes-or-no-p 'y-or-n-p)

(defadvice occur (after goto-and-resize activate compile)
  "After opening an occur window, goto the buffer and resize it"
  (let ((w (get-buffer-window "*Occur*")))
    (when (window-live-p w)
      (select-window w)))
  (shrink-window-if-larger-than-buffer))
;; (defun gtd ()
;;    (interactive)
;;    (find-file "/home/simon/Document/Org/Agenda.org"))

;; (global-set-key (quote [M-up]) (quote backward-sentence))
;; (global-set-key (quote [M-down]) (quote forward-sentence))
(autoload 'c-hungry-delete "cc-cmds")
(global-set-key (quote [C-backspace]) (quote c-hungry-delete))

(defun kill-word-at-caret (arg)
  (interactive "p")
  (kill-region
   (progn
     (backward-word arg) (point))
   (progn
     (forward-word arg) (point))))
(global-set-key (quote [s-backspace]) (quote kill-word-at-caret))

;; some handy shortcur picked from prelude
(defun prelude-kill-whole-line (&optional arg)
  "A simple wrapper around command `kill-whole-line' that respects indentation.
Passes ARG to command `kill-whole-line' when provided."
  (interactive "p")
  (kill-whole-line arg)
  (back-to-indentation))
(global-set-key (kbd "s-k") 'prelude-kill-whole-line)

(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file))
(global-set-key (kbd "H-SPC") 'find-user-init-file)

(defun smart-open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))
(global-set-key [(shift return)] 'smart-open-line)

(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))
(global-set-key (quote [M-up]) (quote move-line-up))
(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))
(global-set-key (quote [M-down]) (quote move-line-down))

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
	(if (region-active-p)
		(setq beg (region-beginning) end (region-end))
	  (setq beg (line-beginning-position) end (line-end-position)))
	(comment-or-uncomment-region beg end)
	(forward-line 1)))
(global-set-key "\273" (quote comment-or-uncomment-region-or-line))

(defun copy-line-or-region ()
  (interactive)
  (let (beg end)
	(if (region-active-p)
		(setq beg (region-beginning) end (region-end))
	  (setq beg (line-beginning-position) end (line-end-position)))
	(kill-ring-save beg end)))
(global-set-key "\367" (quote copy-line-or-region))

(defun transpose-buffers (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

;; (add-hook 'find-file-hook
;;           '(lambda ()
;;              (if (file-symlink-p buffer-file-name)
;;                  (progn
;;                    (setq buffer-read-only t)
;;                    (message "File is a symlink!")))))
;; (defun insert-time()
;;   (interactive "*")
;;   (insert (current-time-string)))
(defun insert-date()
  (interactive "*")
  (let ((insert-date-format "%x"))
    (insert (format-time-string insert-date-format
                                (current-time)))))
(global-set-key "j" (quote insert-date))


(defun read-char-from-minibuffer (&optional prompt)
  (let (cursor-in-echo-area)
    (setq cursor-in-echo-area t)
    (and prompt (message "%s" (propertize prompt 'face '(:weight bold))))
    (read-char)))
(defun open-with()
  "Open file with xdg-open in linux"
  (interactive)
  (when buffer-file-name
    (let ((process-connection-type nil)
	  (browser (read-char-from-minibuffer "Open with: [g]Google Chrome [f]Firefox [o]Opera [x]xdg-open")))
      (setq browser (char-to-string browser))
      (cond ((string-match browser "o") (start-process "" nil "opera" buffer-file-name))
	    ((string-match browser "g") (start-process "" nil "google-chrome" buffer-file-name))
	    ((string-match browser "f") (start-process "" nil "iceweasel" buffer-file-name))
	    ((string-match browser "x") (start-process "" nil "open" buffer-file-name))
	    (t (message "Open with browser canceled"))))))
      ;; (start-process "" nil "xdg-open" buffer-file-name))))
    ;; (shell-command (concat "xdg-open " buffer-file-name)))) ;; this will froze emacs
(global-set-key "o" (quote open-with))


(defun previous-buffer()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))
(global-set-key (kbd "<f1>") 'previous-buffer)

(defun rename-file-and-buffer()
  "Rename current buffer and the relative file using dired"
  (interactive)
  (setq rename-jumped-back nil)
  (require 'dired)
  (dired-jump)
  (defadvice dired-do-rename (after goto-previous-buffer activate compile)
    "After rename in dired,return to the buffer"
    (unless rename-jumped-back
      (command-execute 'previous-buffer)
      (setq rename-jumped-back t)))
  (require 'dired-aux)
  (command-execute 'dired-do-rename))
(global-set-key (kbd "<f2>") 'rename-file-and-buffer)

;; remove file buffers
(defun kill-all-buffers()
  "Kill all buffers that match buffer-file-name"
  (interactive)
  (mapc 'kill-buffer
	(remove-if-not 'buffer-file-name (buffer-list))))

;; the following commands are borrowed from WangYin's setup
;; http://docs.huihoo.com/homepage/shredderyin/emacs_elisp.html

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)

(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))
(define-key global-map (kbd "C-c a") 'wy-go-to-char)
