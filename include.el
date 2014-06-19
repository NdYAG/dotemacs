;;----------------------------------------
;; include.el (el files loader)
;;
;; Copyright (c) 2013 Simon Day
;;
;; Author: Simon Day <i@daix.me>
;; URL: http://daix.me
;;----------------------------------------
(require 'cl)

(defun full-user-path (p)
  (concat user-emacs-directory p))

(defun include-load (lib)
  (let ((path (file-name-sans-extension (locate-library lib)))
        (el)
        (elc))
    (setq el  (concat path ".el"))
    (setq elc (concat path ".elc"))
    (unless (and (file-exists-p elc)
                 (file-newer-than-file-p elc el))
      (if (file-exists-p elc) (delete-file elc))
      (byte-compile-file el))
    (load path)))

;;;###autoload
(defun include (dir &optional files)
  "load every file in the directory specified by first argument.
if second argument is given, only files in the `files` list will be loaded"
  (when (file-directory-p (full-user-path dir))
    (if files
        (setq files (mapcar '(lambda (f) (concat f ".el")) files))
      (setq files (directory-files (full-user-path dir))))
    (dolist (file files)
      (when (string-match "el$" file)
	(include-load (concat dir (file-name-sans-extension file)))))))

;;;###autoload
(defun include-packages (&rest packages &key then)
   "automatically check required packages, and install the missed"
   (message "%s" "Checking packages...")
   (setq missed (remove-if 'package-installed-p packages))

   (when (> (length missed) 0)
     (message
      "%s"
      (format "Packages %s missed."
              (mapconcat (lambda (p) (format "%s" p)) missed ",")))
     (package-refresh-contents)
     (mapcar
      (lambda(p)
	(message "Installing package %s" p)
	(package-install p))
      missed)
     (package-initialize))
   (when then (funcall then)))

;; deprecated
;;;###autoload
(defun include-path (p)
  "add path and its sub-directories to `load-path` list"
  (setq p (full-user-path p))
  (add-to-list 'load-path p)
  (dolist (f (directory-files p))
    (let ((name (concat p "/" f)))
      (when (and (file-directory-p name) 
		 (not (equal f ".."))
		 (not (equal f ".")))
	(add-to-list 'load-path name)))))

(provide 'include)
