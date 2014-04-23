;----------------------------------------
; basic setting
;----------------------------------------
(global-linum-mode t)
(column-number-mode t)
(show-paren-mode t)
(electric-pair-mode t)
(global-hl-line-mode t)
(mouse-avoidance-mode 'animate)

(setq frame-title-format "emacs@%b")
(setq inhibit-startup-screen t)
(setq truncate-partial-width-windows nil)
(setq x-select-enable-clipboard t)

(server-start)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )
