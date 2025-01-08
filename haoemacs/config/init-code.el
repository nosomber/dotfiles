;;(require 'company)
;;(require 'company-box)


;; (add-hook 'prog-mode-hook 'company-mode)
;; (setq company-idle-delay 0.1)
;; (setq company-minimum-prefix-length 2)
;; (setq company-maximum-candidates )
;; (setq company-show-numbers t)

;; 某些 mode 自动开启 eglot
;; (add-hook 'c-mode-hook #'eglot-ensure)
;; (add-hook 'c++-mode-hook #'eglot-ensure)

(add-hook 'eglot-managed-mode-hook
          (lambda ()
            ;;(flymake-mode -1)   ;; Disable flymake-mode
            (eldoc-mode -1)))   ;; Disable eldoc-mode

;; (setq company-backends '(
;;                          company-files              ;; 文件路径补全
;;                          company-capf               ;; 编程语言的补全（通常与 LSP 相关）
;;                          ;;company-dabbrev          ;; 基于相似词汇的补全
;;                          ))

;;(add-hook 'company-mode-hook 'company-box-mode)

(setq font-lock-maximum-decoration 2)   ;代码高亮等级
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ;在编程模式下显示行号
(setq-default display-line-numbers-width 3) ;行号显示区域大小
;; configuration for scheme lisp
(setq scheme-program-name "mit-scheme")

(provide 'init-code)
