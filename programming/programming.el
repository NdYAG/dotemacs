;; Emacs has programming language modes for Lisp, Scheme, the Scheme-based DSSSL expression language, Ada, ASM, AWK, C, C++, Delphi, Fortran, Icon, IDL (CORBA), IDLWAVE, Java, Javascript, Metafont (TeX's companion for font creation), Modula2, Objective-C, Octave, Pascal, Perl, Pike, PostScript, Prolog, Python, Ruby, Simula, Tcl, and VHDL. 
;; From http://www.gnu.org/software/emacs/manual/html_node/emacs/Program-Modes.html

(require 'rainbow-delimiters)

(defun prog-defaults ()
  (subword-mode 1)
  (space-aholic))

(add-hook 'prog-mode-hook 'prog-defaults)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; which-function-mode
;; (add-hook 'prog-mode-hook 'which-function-mode)
;; (setq-default header-line-format
;;               '((which-func-mode ("" which-func-format " "))))
;; (setq mode-line-misc-info
;;             ;; We remove Which Function Mode from the mode line, because it's mostly
;;             ;; invisible here anyway.
;;             (assq-delete-all 'which-func-mode mode-line-misc-info))
