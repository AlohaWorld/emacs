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
;;        :family "΢���ź�"))
;;		:family "Lucida Bright"))
;;		:family "Lucida Console"))
		:family "Yahei Mono"))
;;		:family "YaHei Consolas Hybrid"))
;;		:family "����"))
     )
  )
; here are 20 hanzi and 40 english chars, see if they are the same width
; ����������������������������������������
; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
; /aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/



;; �����еı���
;; '(highline-face ((t (:background "#006600"))))
 '(highline-face ((t (:background "blue"))))
 '(org-mode-line-clock ((t (:background "grey75" :foreground "red" :box (:line-width -1 :style released-button)))) t)
)
;; ==================================================
;; ����emacs���ڵ���ɫ����COLOR-THEME
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


;; ����ָ����ɫ
(set-cursor-color "yellow")

;; ���ù���ڲ�ͬ״̬�µ���ʽ
;; package: cursor-chg
(require 'cursor-chg)  ; Load this library
(change-cursor-mode 1) ; On for overwrite/read-only/input mode
(toggle-cursor-type-when-idle 1) ; On when idle






;; ��������һЩ��ɫ���﷨������ʾ�ı��������⣬����ѡ��ı��������⣬����ѡ��ı�����ѡ��
;;(set-face-foreground 'highlight "white")
;;(set-face-background 'highlight "blue")
;;(set-face-foreground 'secondary-selection "skyblue")
;;(set-face-background 'secondary-selection "darkblue")

;;����������һЩ��ɫ
(setq calendar-load-hook
'(lambda ()
(set-face-foreground 'diary-face "skyblue")
(set-face-background 'holiday-face "slate blue")
(set-face-foreground 'holiday-face "white")))
 
;;-------------------------Shell ʹ�� ansi color-------------
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

