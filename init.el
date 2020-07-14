(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                  ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-global)
(straight-use-package 'use-package)

(use-package evil
    :straight t
    :config
    (evil-mode 1))

(use-package evil-leader
  :straight t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader ","))

(use-package evil-surround 
  :straight t
  :config
  (global-evil-surround-mode))


(use-package which-key
  :straight t
  :config
  (which-key-mode 1))


(evil-leader/set-key "f" 'find-file)

(global-set-key (kbd "C-w") 'backward-kill-word)

(use-package powerline
  :straight t
  :config
  (powerline-center-evil-theme))


;; (use-package dired-x
;;   :straight t)

(use-package popwin
  :straight t
  :config
  (popwin-mode 1)
  (evil-leader/set-key "p" popwin:keymap))

(global-set-key (kbd "C-z") popwin:keymap)

; (autoload 'go-mode "go-mode" nil t)
(use-package go-mode
  :mode "\\.go\\'"
  :interpreter "go"
  :straight t)

(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

; (use-package go-eldoc
;              :straight t
;              :init
;              (setq go-eldoc-gocode "/Users/zhenlei/go-workspace/bin/gocode")
;              :hook
;              (go-mode . eldoc-mode))
; (add-hook 'go-mode-hook 'go-eldoc-setup)

(use-package monokai-theme
  :straight t
  :init
  (load-theme 'monokai 1))

(use-package hungry-delete
  :straight t)
(global-hungry-delete-mode)

;; (use-package smex
;;   :straight t
;;   :init
;;   (smex-initialize))

;; (use-package company
;;   :straight t
;;   :init
;;   (company-mode)
;;   :hook
;;   (prog-mode . company-mode))

(use-package company
  :straight t
  :init
  (company-mode))

(global-company-mode 1)

(add-hook 'after-init-hook 'global-company-mode)

; (evil-leader/set-key "j" 'godef-jump)
; (add-hook 'go-mode-hook 'lsp-deferred)

;; 任意文件直接在 Finder 中打开
(use-package reveal-in-osx-finder
  :straight t
  :bind
  (("C-c f" . 'reveal-in-osx-finder))
  )

;; (toggle-frame-fullscreen)

(toggle-frame-maximized)
