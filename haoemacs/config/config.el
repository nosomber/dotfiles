;; 加速配置。
(require 'init-accelerate)

;; 字体设置
(require 'init-font)

(let (
      ;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.6)
      ;; 清空避免加载远程文件的时候分析文件。
      (file-name-handler-alist nil))

  ;; 让窗口启动更平滑
  (setq frame-inhibit-implied-resize t)
  (setq-default inhibit-redisplay t
                inhibit-message t)
  (add-hook 'window-setup-hook
            (lambda ()
              (setq-default inhibit-redisplay nil
                            inhibit-message nil)
              (redisplay)))

  (with-temp-message ""              ;抹掉插件启动的输出
    (require 'init-generic)
    (when (display-graphic-p)
      (require 'init-theme))
    
    (require 'lazy-load)
    (require 'one-key)

    (require 'basic-toolkit)
    (require 'init-highlight-parentheses)
    (require 'init-mode)
    (require 'init-indent)  ; 将 c-mode 设为 2

    (require 'init-key)

    ;;(require 'init-performance)
    (require 'init-rime)

    ;; 可以延后加载的
    (run-with-idle-timer
     1 nil
     #'(lambda ()
         (require 'init-yasnippet)
         (require 'init-cursor-chg)
         (require 'init-org)
         (require 'init-idle)
         (require 'init-code)
         (require 'init-save)

         (require 'init-olivetti)
         ))))

(provide 'config)
