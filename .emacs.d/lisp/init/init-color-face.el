;;==============================================================================
;; In this init file, The attributes of fonts/colors are set
;;
;; Note: 
;;    1.  For the number in (set-face-attribute 'default nil :height 100)
;;        The value is in 1/10pt, so 100 will give you 10pt, etc.
(custom-set-faces
 '(default (
     (t 
	   (:stipple nil 
	    :background "#000000" 
		:foreground "#ccccff" 
		:inverse-video nil 
		:box nil 
		:strike-through nil 
		:overline nil 
		:underline nil 
;;;		:slant normal 
;;;		:weight normal 
		:height 140
;;		:height normal
;;;		:width normal
		:foundry "outline" 
;;		:family "Courier New"))
;;        :family "微软雅黑"))
;;		:family "Lucida Bright"))
;;		:family "Lucida Console"))
		:family "Yahei Mono"))
;;		:family "YaHei Consolas Hybrid"))
;;		:family "楷体"))
     )
  )
; here are 20 hanzi and 40 english chars, see if they are the same width
; 你你你你你你你你你你你你你你你你你你你你
; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
; /aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/



;; 高亮行的背景
;; '(highline-face ((t (:background "#006600"))))
 '(highline-face ((t (:background "blue"))))
 '(org-mode-line-clock ((t (:background "grey75" :foreground "red" :box (:line-width -1 :style released-button)))) t)
)
;; ==================================================
;; 设置emacs窗口的颜色方案COLOR-THEME
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
;;(color-theme-comidia)
;; (color-theme-hober)
;;(color-theme-clarity)
;; (color-theme-charcoal-black)
(color-theme-ld-dark)

)) ;; end (progn


;; 设置指针颜色
(set-cursor-color "yellow")

;; 设置光标在不同状态下的样式
;; package: cursor-chg
(require 'cursor-chg)  ; Load this library
(change-cursor-mode 1) ; On for overwrite/read-only/input mode
(toggle-cursor-type-when-idle 1) ; On when idle






;; 设置另外一些颜色：语法高亮显示的背景和主题，区域选择的背景和主题，二次选择的背景和选择
;;(set-face-foreground 'highlight "white")
;;(set-face-background 'highlight "blue")
;;(set-face-foreground 'secondary-selection "skyblue")
;;(set-face-background 'secondary-selection "darkblue")

;;设置日历的一些颜色
(setq calendar-load-hook
'(lambda ()
(set-face-foreground 'diary-face "skyblue")
(set-face-background 'holiday-face "slate blue")
(set-face-foreground 'holiday-face "white")))
 
;;-------------------------Shell 使用 ansi color-------------
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

