;----------------------------------------
; frame control (for linux)
;----------------------------------------
(defun maximize-window ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
)
;;(maximize-window)

;;toggle fullscreen
;; (defun toggle-fullscreen (&optional f) 
;;    (interactive) 
;;    (let ((current-value (frame-parameter nil 'fullscreen))) 
;;      (set-frame-parameter nil 'fullscreen 
;;               (if (equal 'fullboth current-value) 
;;                   (if (boundp 'old-fullscreen) old- 
;;  fullscreen nil) 
;;                 (progn (setq old-fullscreen current- 
;;  value) 
;;                    'fullboth))))) 
 ;; (add-hook 'window-setup-hook 'toggle-fullscreen) 
(defun fullscreen ()
  (interactive) 
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 
                         '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
(global-set-key [f11] (quote fullscreen))

;; _OB_ for openbox
(defun undecorate ()
  (interactive) 
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 
                         '(2 "_OB_WM_STATE_UNDECORATED" 0)))
(global-set-key [M-f11] (quote undecorate))
