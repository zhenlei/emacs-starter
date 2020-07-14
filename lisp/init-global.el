
(defun open-init-file()
 (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq cursor-type 'bar)

;; 显示行号
(global-linum-mode 1)

;; 禁止 Emacs 自动生成备份文件
(setq make-backup-files nil)

;; 高亮当前行
(global-hl-line-mode 1)

;; 启用自动括号匹配（Highlight Matching Parenthesis）
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)

;; 关闭自己生产的保存文件
(setq auto-save-default nil)

;; (require 'recentf)
;; (recentf-mode 1)
;; (setq recentf-max-menu-item 10)

;; 使用下面的配置文件将删除功能配置成与其他图形界面的编辑器相同，即当你选中一段文字 之后输入一个字符会替换掉你选中部分的文字
(delete-selection-mode 1)

(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
                                            ;; Shifu
                                            ("#inc" "#include<>")
                                            ;; Tudi
                                            ("8lxy" "lixinyang")
                                            ))


(provide 'init-global)
