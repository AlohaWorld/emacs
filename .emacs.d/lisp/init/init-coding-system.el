;;++语言环境字符集设置++++++++++++++++++++++++++++++++++++++++++++++++

(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'utf-8)
;; (set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
;; (set-terminal-coding-system 'euc-cn)
(set-buffer-file-coding-system 'utf-8)
;; (set-buffer-file-coding-system 'euc-cn)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
;; (set-selection-coding-system 'euc-cn)
(modify-coding-system-alist 'process "*" 'utf-8)
;; (modify-coding-system-alist 'process "*" 'euc-cn)
(setq default-process-coding-system '(utf-8 . utf-8))
;;(setq-default pathname-coding-system 'utf-8)
(setq-default pathname-coding-system 'euc-cn)
;;(set-file-name-coding-system 'utf-8)
(set-file-name-coding-system 'euc-cn)
;;  (set-keyboard-coding-system 'euc-cn)

;; 剪贴板必须使用euc-cn编码，否则，从emacs外面贴进来的中文都是乱码
(set-clipboard-coding-system 'euc-cn)
;;  (setq default-process-coding-system 
;;              '(chinese-iso-8bit-dos))
;;              ;;euc-cn . euc-cn))
