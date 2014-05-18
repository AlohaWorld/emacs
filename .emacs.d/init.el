;; ==================================================
;; Filename: init.el
;; Emacs initialization file
;; Cui Yidong
;; Rev 20140503
;; ==================================================


;; ==================================================
;; 为Windows下的emacs增加加载路径
;; setq 序列 (concat 序列 " " (int-to-string 变))
;;(defvar basicPath "~/.emacs.d/"

;(setq org-agenda-files
;      (if (eq system-type 'windows-nt)
;          '("windows-path/file.org")
;        '("unix-path/file.org")))
(defvar basicPath "D:/MyDocument/60.Applications/emacs/.emacs.d/"
	"所有emacs自定义目录所在的基础路径" )
(defvar orgPath "D:/MyDocument/99.Org/"
	"所有org文件所在的基础路径" )

(if (eq system-type 'windows-nt)
	(defvar cygwin-root-path "c:/cygwin/"
	  "cygwin的根目录" ))

(add-to-list 'load-path (concat basicPath "lisp") )
(add-to-list 'load-path (concat basicPath "lisp/mylib") )
(add-to-list 'load-path (concat basicPath "lisp/haskell-additional"))
(add-to-list 'load-path (concat basicPath "lisp/emacs-w3m") )
(add-to-list 'load-path (concat basicPath "elpa/highline-7.2.2") )
(add-to-list 'load-path (concat basicPath "lisp/python") )

;; 以下在lisp/init/init-color-face.el中使用
;; 凡是字体和色彩的配置，都参见 init-color-face.el
(add-to-list 'load-path (concat basicPath "lisp/theme") )

;; lisp/init 目录存放各种功能的初始化代码
(add-to-list 'load-path (concat basicPath "lisp/init"))
(add-to-list 'load-path "~/.emacs.d")


;;------------------------------------------------
;; 以下是关于org模式初始化的相关路径。具体使用请参见 lisp/init/init-org.el

;; org-mode 8.0的内容已经被整合到emacs主目陆了,所以下面的elpa下载的包就不用了
;(add-to-list 'load-path (concat basicPath "elpa/org-20130603") )

(defvar orgPath "D:/MyDocument/99.Org/"
  "所有org文件所在的基础路径" )
;; dropbox 是用来做pc与手机端的 mobile org mode 内容同步的
(defvar dropboxPath "D:/MyDocument/95.Dropbox/Dropbox/")

;; 将 org 的 contrib 子目录加入到 emacs path 中
;; org 目录中有个 contrib 子目录，其中包含额外的org功能文件
;;   org-checklist.el 就在该目录中
(defvar orgContribPath "C:/home/bin/Emacs/lisp/org/contrib/lisp/")
(add-to-list 'load-path orgContribPath)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;; Emacs 24 is now supporting build-in package
(when
    (load "package")
  (package-initialize)
)


;; ==================================================
;; 利用Emacs 24中的package功能从网上的包库中查找各种包
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                        ;; ("gnu" . "http://elpa.gnu.org/packages/")
						 ))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives 
			 '("org" . "http://orgmode.org/elpa/") t)
;; ==================================================
;; “日记”存放的位置
(setq diary-file (concat basicPath "diary"))

;; ==================================================
;; 信息备份
;; 所有的备份文件转移到~/backups目录下
(require 'backups)
(move-backups t)
(setq backup-directory (concat basicPath "backups"))


;;===================================================
;; 设置个人信息
(setq user-full-name "Cui Yidong")
(setq user-mail-address "nathan.cui@gmail.com")

;;==================================================
;;可以将上次的桌面保存下来，每次重启emacs时自动加载
;; (load "desktop") 
(desktop-save-mode 1)
(savehist-mode 1)
;; emacs启动时，一次加载不超过8个buffer，其它的buffer在emacs idle时再加载
(setq  desktop-restore-eager 5)
;;(desktop-load-default) 
;;(desktop-read) 

;; ==================================================
;; 设置全屏(fullscreen) ，仅限在Windows操作系统中使用
;;;;; 方法 1：用 emac_fullscreen.exe 配合（放置在Path中的某个目录下）
;;;;;        但是会被windows taskbar挡住
(defun toggle-full-screen () (interactive) (shell-command "emacs_fullscreen.exe"))
(if (eq system-type 'windows-nt)
	(global-set-key [(control f12)] 'toggle-full-screen)
)

;;;;; 方法 2: 用 darkroom-mode, 其中有w32toggletitle.exe配合
;;;;; !!!!!! cyd@20120820 这个方法很糟糕，会让屏幕乱掉 !!!!
;; (add-to-list 'load-path (concat basicPath "lisp/fullscreen") )
;; (require 'darkroom-mode)

;;===================================================
;; 设置当地经纬度，便于从日历中查到日出日落时间
(setq calendar-latitude 39.55) ;;纬度，正数北纬 
(setq calendar-longitude 116.25) ;;经度，正数东经 
(setq calendar-location-name "Beijing") ;;地名 


;;===================================================
;; 启用农历
(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays (append cal-china-x-important-holidays calendar-holidays))


;;++以下内容与显示相关+++++++++++++++++++++++++++++++++++++++++++++++++++++

;; ==================================================
;; no scroll bar, even in x-window system
(set-scroll-bar-mode nil)

;; ========================================================
;; 设置emacs窗口的位置和大小
;; 让窗口最大化
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;;设置emacs启动窗口大小
(setq default-frame-alist
 '((height . 25) (width , 50) (menu-bar-lines . 20) (tool-bar-lines . 0)))

;; ==================================================
;; 指定系统的各种色彩搭配
;; 相关的配置在 basicPath/lisp/init/init-color-face.el 文件中
;; - 设置系统的 face 或者系统的color-theme。
;; - 设置高亮行的背景
;; - 设置光标颜色
;; - 设置日历颜色
;; - 设置shell的颜色

(load "init-color-face.el")

;; ========================================================
;; 设置Emacs的标题条文字
(setq frame-title-format "%b - Emacs")

;; ========================================================
;; 设置状态栏(mode-line)的信息
(load "init-mode-line")
;; ========================================================
;; 不要那个如此大的工具条 
(tool-bar-mode -1) 

;; ========================================================
;; 在emacs顶部显示tab
;;(load "tabbar")
;;(tabbar-mode t)
;;(global-set-key [(control f10)] 'tabbar-local-mode)
;;(global-set-key [(control shift tab)] 'tabbar-backward)
;;(global-set-key [(control tab)]       'tabbar-forward)


;; =====================================================================
;; 当处于阅读模式时，不要自动将过长的文本折叠
;(hscroll-global-mode t)


;; =====================================================================
;;要显示匹配的括号
(show-paren-mode 1)

;; ==================================================
;; 在左侧单独的frame/window中显示行号
;; (require 'linum)
(global-set-key "\C-cn" 'linum-mode)
(linum-mode 't)

;; ==================================================
;; 像Windows下编辑器那样, 高亮显示要拷贝的区域
(setq transient-mark-mode t)

;; ==================================================
;;光标靠近鼠标的时候，让鼠标自动让开，别挡住视线
(mouse-avoidance-mode 'animate) ;; (mouse-avoidance-mode "banish")

;;; ### Revive ###
;;; --- 用于记录恢复特定窗口配置方案
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)
(setq revive:configuration-file (concat basicPath "revive-configure")) 
;窗口布局设置保存文件


;;在同一个窗口显示speedbar而不是另开一个窗口
;;http://www.emacswiki.org/emacs/SpeedBar
;;http://www.emacswiki.org/emacs/SrSpeedbar
;;http://www.emacswiki.org/emacs/sr-speedbar.el
;(require 'sr-speedbar)
;(require 'speedbar-extension)
;(global-set-key (kbd "C-c C-'") 'sr-speedbar-toggle) ;;sr-speedbar按键绑定
;(setq speedbar-show-unknown-files t);;可以显示所有目录以及文件
;(setq dframe-update-speed nil);;不自动刷新，手动 g 刷新
;(setq speedbar-update-flag nil)
;(setq speedbar-use-images nil);;不使用 image 的方式
;(setq speedbar-verbosity-level 0)

;; ==================================================
;;让窗格旋转起来
;; M-x rotate-window-clockwise RET 
;; 和 
;; M-x rotate-window-anticlockwise RET 
;; 可行将窗格顺时针旋转90度和逆时针旋转90度。旋转后的窗格，
;; 仍然按比例分布,且保持窗格焦点和point。 
;; 由于各自的window-min-width和window-min-height的不同， 
;; 可能会因为在某个方向上窗格太多而导致旋转过后，窗格无法分割， 
;; 这个时候就可能会有部分窗格丢失，此时会有几个选项： 
;; y 表示仍然继续，如果想挽回的话，可以马上反向操作 
;;    即可找回刚才丢失的窗格。 
;; n 表示退出本次操作。 
;; s 表示把当前的状态储存下来，然后继续旋转操作，储存下来的状态 
;;    可以通过M-x load-layout RET命令来恢复。  
;; 另外，save-layout和load-layout命令也可以单独使用。 
(require 'rotate-window)
(global-set-key (kbd "C-c <up>") 'rotate-window-clockwise)
(global-set-key (kbd "C-c <down>") 'rotate-window-anticlockwise)


;; 窗口分割和旋转
(require 'subwindow)
(global-set-key (kbd "C-x 4 3") 'split-window-3) 

;; Buffer 切换和旋转
;; 已经通过 melpa 安装，不需要再行设置
(require 'buffer-move)
; (global-set-key (kbd "<C-S-up>")     'buf-move-up)
; (global-set-key (kbd "<C-S-down>")   'buf-move-down)
; (global-set-key (kbd "<C-S-left>")   'buf-move-left)
; (global-set-key (kbd "<C-S-right>")  'buf-move-right)
(global-set-key (kbd "C-x <up>")     'buf-move-up)
(global-set-key (kbd "C-x <down>")   'buf-move-down)
(global-set-key (kbd "C-x <left>")   'buf-move-left)
(global-set-key (kbd "C-x <right>")  'buf-move-right)

;; ==================================================
;; golden-ratio-mode
;; 自动将当前窗口大小变为整个frame的0.618
(golden-ratio-mode t)


;; ==================================================
;; Buffer 管理，将 C-x C-b 从Buffer Menu切换为 iBuffer
(global-set-key (kbd "C-x C-b")      'ibuffer)

;; ==================================================
;; Buffer 字体缩放

(load "bhj-fonts")
;; C-x C-- size down
;; C-x C-= size up

;; ==================================================
;; 彩色文本导出为HTML
;; (load "htmlize")

;; ==================================================
;; Enable uppercase or lowercase conversions
;(put 'downcase-region 'disabled nil)
;(put 'upcase-region 'disabled nil)

;; =====================================================================
;; 回答“是/否” 
;; =====================================================================
(defun yes-or-no-p (arg)
  "An alias for y-or-n-p, because I hate having to type 'yes' or 'no'."
  (y-or-n-p arg))

;; =====================================================================
;; 将文件扩展名与特定的模式关联
(setq auto-mode-alist
  (append '(("\\.css$"  . css-mode)
            ("\\.c$"    . c-mode)
            ("\\.cc$"   . c++-mode)
            ("\\.cpp$"  . c++-mode)
            ("\\.cxx$"  . c++-mode)
            ("\\.e$"    . eiffel-mode)
            ("\\.hxx$"  . c++-mode)
            ("\\.h$"    . c++-mode)
            ("\\.hh$"   . c++-mode)
            ("\\.idl$"  . c++-mode)
            ("\\.ipp$"  . c++-mode)
            ("\\.java$" . java-mode)
            ("\\.lua"   . lua-mode)
            ("\\.pl$"   . perl-mode)
            ("\\.pm$"   . perl-mode)
            ("\\.rb$"   . ruby-mode)
            ("\\.rbw$"  . ruby-mode)
            ("\\.t2t$"  . t2t-mode)
            ("\\.txt$"  . text-mode)
			("\\.hs$"  . haskell-mode))
         auto-mode-alist))

;; =====================================================================
;;  auto-fill-mode: 当输入的文本过宽时，会自动换行
;;  Automatically turn on auto-fill-mode when editing text files
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; If you want to change the word wrap column, change this number
(setq-default fill-column 80)

;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插
;;入两个空格
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;;++以下内容与搜索替换有关+++++++++++++++++++++++++++++++++++++++++++++++++++++

;; ==================================================
;; How do I control Emacs's case-sensitivity when searching/replacing?
;; For searching, the value of the variable case-fold-search determines
;;    whether they are case sensitive:
;  (setq case-fold-search nil) ; make searches case sensitive
(setq case-fold-search t)   ; make searches case insensitive
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



;;++以下内容与快捷键有关+++++++++++++++++++++++++++++++++++++++++++++++++++

;;跳到某一行 系统默认是 \M-gg 或者\M-g\M-g
;; (global-set-key "\M-gg" 'goto-line) ; 默认就是\M-gg，无需设置
;;跳到某一列
(defun go-to-column (column)
  (interactive "nColumn: ")
  (move-to-column column t))
(global-set-key "\M-g\M-g" 'go-to-column)

;; 全选当前文本
; (global-set-key "\C-a" 'mark-whole-buffer)

;; 无需确认即关闭当前缓冲区
(global-set-key "\C-xk" 'kill-current-buffer)
(defun kill-current-buffer ()
  "Kill the current buffer, without confirmation."
  (interactive)
  (kill-buffer (current-buffer)))
  
;;=========== 快速跳转到某个字符 ========================================
;;按 C-c f x (x 是任意一个字符) 时，光 标就会到下一个 x 处。再次按 x，光标就
;;  到下一个 x。比如 C-c f w w w w ..., C-c f b b b b b b ...
;;这个方式类似 vi 的 "f" 。
(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
					 char)
	(search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))
;; (define-key global-map (kbd "C-c f") 'wy-go-to-char)
(global-set-key "\C-cf" 'wy-go-to-char)


;; F1键改为全局帮助键，查找光标所在的单字
;; (global-set-key [f1] (lambda () (interactive) (manual-entry (current-word))))
  
;; ==================================================
;; 括号匹配：Emacs 在匹配的括号间跳转时按 C-M-f 和 C-M-b。
;; vi使用 % 很方便。当 % 在括号上按下时，匹配括号，否则输入 % 
(global-set-key "%" 'match-paren)
          
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))
;; end [] match


;; =========================================================
;; 输入左括号时，自动输入右括号
(require 'autopair)
(autopair-global-mode) ;; to enable in all buffers
;; python 存在'''模式，做特殊处理
(add-hook 'python-mode-hook
           '(lambda ()
               (setq autopair-handle-action-fns
                     (list 'autopair-default-handle-action
                           'autopair-python-triple-quote-action))))

;; ==================================================
;; 使用Ctrl-x o切换窗口太费劲，改为 Ctrl-o 
(global-set-key [(control o)] 'other-window)
 
;; ==================================================
;; 记住翻页前的位置
(setq scroll-preserve-screen-position t)

(setq track-eol t)    ; 当光标在行尾上下移动的时候，始终保持在行尾。

;;防止页面滚动时跳动， scroll-margin 1 可以在靠近屏幕边沿
;;1行时就开始滚动，可以很好的看到上下文
(setq scroll-margin 1
	   scroll-conservatively 10000)


;; ==================================================
;;把这些缺省禁用的功能打开
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
;; (put 'upcase-region 'disabled nil)
;; (put 'downcase-region 'disabled nil)

;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

;;++语言环境字符集设置(utf-8)+++++++++++++++++++++++++++++++++++++++++++
;; 参见 basicPath/lisp/init/init-coding-system.el
(load "init-coding-system")

;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;++各种程序设计语言模式初始化++++++++++++++++++++++++++++++++++++++++++
;; 参见 basicPath/lisp/init/init-programming.el
(load "init-programming")


;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; ========= Auto Complete 初始化 ==========================
(require 'init-auto-complete)


;;++以下和自动文本有关++++++++++++++++++++++++++++++++++++++++++++++++++

;; ==================================================
;; 打开time-stamp可以记录最后运行time-stamp的时间
;;		缺省的情况下, 在所编辑文件的前八行内插入如下标记
;;			Time-stamp: <>   或者
;;			Time-stamp: " "   
;;		Emacs在保存时就会运行write-file-hooks中的time-stamp, 从而加 入修改时间, 
;;		结果类似下面所示
;;			Time-stamp: <jerry 12/17/2003 12:00:54 (unidevel.com)>
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-format "%:u %04y/%02m/%02d %02H:%02M:%02S")

;; 要使用中文表示, 可以如下设置，"最后更新时间:"行后所有字符都将
;; 无条件被替换为"XXXX年XX月XX日" 格式的时间
(setq time-stamp-start "最后更新时间:[     ]+\\\\?")
(setq time-stamp-end: "\n")
;; (setq time-stamp-format: "%:y年%:m月%:d日")
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)

;; ++ 其他 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; ==================================================
;; 用 (require 'cl) 可以加载 cl-macs.el；即Common Lisp Macros
(require 'cl)
;; 已经有了ac，就不用 dabbrev了
;;  (require 'dabbrev-hover)
;;  (dabbrev-hover-install t t)

;; ==================================================
;; auto table. Change to buildin table.el @20140124
(require 'table)
(autoload 'table-insert "table" "WYGIWYS table editor")

;; ==================================================
;;设置缺省模式是text，而不是基本模式 
(setq default-major-mode 'text-mode) 
(add-hook 'text-mode-hook 'turn-on-auto-fill) 

;; ==================================================
;;设置tab为4个空格的宽度，而不是原来的2 
(setq default-tab-width 4) 

;; ======= IDO 模式 ==================================
;; 启用ido模式，把备选项直接列出来，你可以输入几个字来缩小
;; 备选范围，也可以用其它键来导航、选择 
(ido-mode t)
(setq ido-enable-flex-matching t)    ;模糊匹配
;; (setq ido-everywhere nil)         ;禁用ido everyting, 拷贝操作不方便
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))

;; BELOW is from http://doc.norang.ca/org-mode.html
;;   18.35 Use Smex For M-X Ido-Completion
; (require 'smex)
; (smex-initialize)
; 
; (global-set-key (kbd "M-x") 'smex)
; (global-set-key (kbd "C-x x") 'smex)
; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
; 

;; ==================================================
;; 在minibuffer中支持 M-x 自动匹配
;; (require 'anything-config)

;; ==================================================
;; 启用文本补全
(setq ispell-program-name (expand-file-name "bin/aspell.exe" cygwin-root-path))
(if (eq system-type 'windows-nt)
	(global-set-key "\M-/" 'ispell-complete-word)
)

;; ==================================================
;;开启图片浏览(Windows下面，需要一些动态链接库的支持）
;;查看所需库文件的指令是 M-: image-library-alist RET
(require 'thumbs) 
(auto-image-file-mode t) 				;
   										 
;; ==================================================
;; 去掉每次启动emacs出来的无用的“信息”
(setq inhibit-startup-message t)

;; ==================================================
;; 设置拷贝 | 粘贴 | 搜索 | 替换；参见 basePath/lisp/init/init-cps.el
(load "init-cps")

;;++Org模式初始化+++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; 参见 basicPath/lisp/init/init-org.el
(load "init-org")

;; ==================================================
;; 设置stardict查词
;; ***相关文件安装***请参见 basicPath/lisp/init/init-stardict.el
(if (eq system-type 'windows-nt)
	(load "init-stardict")
)

;; ==================================================
;; Emacs启动之后，首先显示日程列表

(add-hook 'after-init-hook 'split-window-horizontally)
;(add-hook 'after-init-hook 'split-window-vertically)
(add-hook 'after-init-hook 'org-agenda-list)

;; ==================================================
;;w3m 
;;(setq w3m-command "~/")
(require 'w3m)
;;;设置w3m为emacs的默认浏览器
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;;(autoload 'w3m-toggle-inline-images "w3m" "set to display images." t)
(global-set-key "\C-xm" 'w3m-goto-url-new-session)

(require 'w3m-load)
(setq w3m-use-favicon nil) 
(setq w3m-command-arguments '("-cookie" "-F")) 
(setq w3m-use-cookies t) 
;;(require 'mime-w3m)
;;(setq w3m-default-toggle-inline-images t)
(setq w3m-default-display-inline-images t)

;; ==================================================
;; highline 模式设置：将当前行加亮；应放到最后
(load "init-highline")
(highline-mode 1)

;; ==================================================
;; 将不用的buffer全部杀掉
(kill-buffer "*scratch*")

;; ==================================================
;; setup helm
(require 'helm-config)

 
 ;; ========================================================
;; 设置emacs daemon模式（与Linux 的emacs daemon不同，需要先
;;     启动一个emacs实例）
;; 第1步：设置环境变量（与emacs 安装位置有关）
;;    新建 HOME环境变量 D:\MyDocument\60.Applications\emacs\
;;    新建EMACS_SERVER_FILE环境变量（emacsclient与daemon通信所用的socket文件）
;;         D:\MyDocument\60.Applications\emacs\.emacs.d\emacs-server-file
;;    新建ALTERNATE_EDITOR环境变量（当daemon不起作用时，启动的编辑器）C:\Program Files (x86)\0Green\emacs\bin\runemacs.exe
;; 第2步：在鼠标右键菜单上加上快捷链接
;;    [HKEY_CLASSES_ROOT\*\Shell\Open With Emacs\command]
;;    @="D:\\emacs-23.3\\bin\\emacsclientw.exe %0"
;; 第3步：在emacs启动文件中设置必要的路径
;; 第4步：如果出现server-ensure-safe-dir错误，则执行如下步骤 （http://stackoverflow.com/questions/5233041/emacs-and-the-server-unsafe-error）
;;	1. Close Emacs
;;  2. Navigate in Windows Explorer to USERNAME/AppData/Roaming/ 
;;  3. If there is NO folder ".emacs.d", created one inside /Roaming/. 
;;  4. Right-Click the folder -> Preferences;
;;  5. there navigate to the "Security" tab -> click the "Advanced" button
;;  6. in the new Window navigate to the "owner" tab and click the button "Edit" (or "Change")
;;  7. Click on your username and click on OK. A warning appears, click ok, you can close all those windows
;;  8. Go inside the ".emacs.d" folder and if there is NO folder "server" create one.
;;  9. When you created it, or if there is a folder "server" follow steps 4-7 for that one too.
;;  Run Emacs happily ever after.
;; 第5步： 如果出现server-ensure-safe-dir错误，也可以使用如下代码（）
;; (require 'server)
;; (and (>= emacs-major-version 23)
;;     (defun server-ensure-safe-dir (dir) "Noop" t))
(setq server-auth-dir basicPath)
(setq server-name "emacs-server-file")
(server-start)