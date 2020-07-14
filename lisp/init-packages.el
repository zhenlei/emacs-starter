(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

(add-to-list 'package-archives
'("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; cl - Common Lisp Extension
(require 'cl)

(require 'evil)
(evil-mode 1)

(require 'dired-x)
(setq dired-dwin-target 1)

(setq auto-save-default nil)
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

(provide 'init-packages)
