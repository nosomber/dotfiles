(require 'kaolin-themes)
;; smooth-scrolling 使得滚动时指针的位置不在顶部或底部
;;(require 'smooth-scrolling)

;;设置默认主题为亮色
(setq-default custom-enabled-themes '(kaolin-light))
(load-theme 'kaolin-light t)

;;设置平滑滚动(缺点是在页末会出现不连贯跳转)
(pixel-scroll-precision-mode 1)
;;(smooth-scrolling-mode 1)


(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
	  (disable-theme theme)
	  (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)

(defun theme-light ()
  "Activate a light color theme."
  (interactive)
  (setq custom-enabled-themes '(kaolin-light))
  (reapply-themes))

(defun theme-dark ()
  "Activate a dark color theme."
  (interactive)
  (setq custom-enabled-themes '(kaolin-galaxy))
  (reapply-themes))

(provide 'init-theme)
