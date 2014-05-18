;; ==================================================
;; 高亮当前行
(require 'highline)

(autoload 'highline-on         "highline"
  "Turn on local highlightining current line in buffer."          t)
(autoload 'highline-off        "highline"
  "Turn off local highlightining current line in buffer."         t)
(autoload 'highline-local-mode "highline"
  "Toggle local minor mode to highlight current line in buffer."  t)
(autoload 'highline-mode-on    "highline"
  "Turn on global highlightining current line in buffer."         t)
(autoload 'highline-mode-off   "highline"
  "Turn off global highlightining current line in buffer."        t)
(autoload 'highline-mode       "highline"
  "Toggle global minor mode to highlight current line in buffer." t)
(autoload 'highline-customize  "highline"
  "Customize highlightining current line in buffer."              t)

;; Turn on local highlighting for Dired (C-x d)
(defun highline-mode-on () (highline-mode 1))
(add-hook 'dired-after-readin-hook #'highline-mode-on)
;; Turn on local highlighting for org-agenda view (C-c aa)
(add-hook 'org-agenda-post-command-hook #'highline-mode-on)
;; Turn on local highlighting for list-buffers (C-x C-b)
(defadvice list-buffers (after highlight-line activate)
  (save-excursion
    (set-buffer "*Buffer List*")
    (highline-mode-on)))

;;设置高亮行的背景颜色
;; 参见 ~/emacs/lisp/emacs_face.el
  
;; 将highline模式的开关绑定到热键 C-c C-g上面
(global-set-key "\C-c\C-g" 'highline-mode)
;; moved to .emacs
;;(highline-mode 1)
