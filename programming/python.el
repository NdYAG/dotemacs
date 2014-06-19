;; Before enable programming features for python,
;; ensure that Jedi, epc are installed
;; `pip install Jedi, epc, pyflakes`
;; 
;; http://tkf.github.io/emacs-jedi/latest/
(include-packages 'jedi
                  'flymake-python-pyflakes)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-executable "flake8")
