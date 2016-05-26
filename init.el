;; ==================================================
;; Filename: init.el
;; Emacs initialization file
;; Cui Yidong
;; Rev 20160521
;; ==================================================

;; ==================================================
;; ChangeLog
;; 20150425 Upgrade to emacs 24.4
;;          Set privilige of emacs.exe
;;          Move org/contrib to ~/.emacs.d/
;;          add load-path or org/contrib/lisp
;; 20150426 Move scripts related with EDIT & SEARCH
;;          to "lisp/init/init-edit.el"
;; 20160521 Tune load-path
;;          Add C/C++ IDE support (cmake)
;;          Tune yasnippet
;; ==================================================
;; 为Windows下的emacs增加加载路径
;; setq 序列 (concat 序列 " " (int-to-string 变))
;;(defvar basicPath "~/.emacs.d/"

;(setq org-agenda-files
;      (if (eq system-type 'windows-nt)
;          '("windows-path/file.org")
;        '("unix-path/file.org")))

(if (eq system-type 'windows-nt)
	(defvar myDocument "D:/MyDocument/"))

(if (eq system-type 'cygwin)
  	(defvar myDocument "/cygdrive/d/MyDocument/"))

(defvar basicPath "~/.emacs.d/"
	"Basic path for any customized dirs in emacs" )

(if (eq system-type 'windows-nt)
	(defvar cygwin-root-path "c:/cygwin/"
	  "root dir of cygwin" ))

;; Add some subdirs under ~/.emacs.d/lisp/ to load-path
(let ((default-directory  (concat basicPath "lisp")))
  (normal-top-level-add-to-load-path '("init"     ;; init scripts
				       "mylib"
				       "haskell-additional"
				       "python"
				       "theme"    ;; used in init-color-face.el
;; org 目录中有个 contrib 子目录，其中包含额外的org功能文件,org-checklist.el 就在该目录中
				       "org/contrib/lisp" ;; additional org-mode support
   )))

;; ==================================================
;; Set the default dir when using C-c C-f to open files
(setq default-directory myDocument)

(if (eq system-type 'windows-nt)
	(defvar orgPath "D:/MyDocument/99.Org/"
		"Path for all .org files" ))

(if (eq system-type 'windows-nt)
	(defvar orgPath "D:/MyDocument/99.Org/"
		"所有org文件所在的基础路径" ))		

;; dropbox 是用来做pc与手机端的 mobile org mode 内容同步的
(if (eq system-type 'windows-nt)
	(defvar dropboxPath "D:/MyDocument/95.Dropbox/Dropbox/"))


;; ===================================================================
;; Check the paths in load-path exist or not
;;  if not exists then prompt errors to user
(dolist (pathx load-path)
  (if (equal nil (file-directory-p pathx))
	  (message (concat "ERROR dir does not exist in load-path: " pathx))
	)
  )



;; ===================================================================
;; Chinese-pyim 词库所在位置
;; 在init-coding-system.el中使用
(defvar pyimDictPath (concat basicPath "pyim/"))

;; ==================================================
;; “日记”存放的位置
(setq diary-file (concat basicPath "diary"))

;; ==================================================
;; 信息备份
;; 所有的备份文件转移到~/backups目录下
(require 'backups)
(move-backups t)
(setq backup-directory (concat basicPath "backups"))


;; ===================================================================
;; Package Management
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;; Emacs 24 is now supporting build-in package
(when (load "package")
  (package-initialize))

;; 利用Emacs 24中的package功能从网上的包库中查找各种包
(setq package-archives '(("tromey" . "http://tromey.com/elpa/")))
(add-to-list 'package-archives
			 '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;(add-to-list 'package-archives
;             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives 
			 '("org" . "http://orgmode.org/elpa/") t)


;; 必须在包管理功能加载后，才能load cygwin path			 
;; Load cygwin path (need cygwin-mount package)
(when (eq system-type 'windows-nt)
	 (progn
		(setenv "PATH" (concat "c:/cygwin/bin;c:/cygwin/usr/bin;c:/cygwin/usr/local/bin;" (getenv "PATH")))
		(setq exec-path (cons "c:/cygwin/bin/" exec-path))
	 (require 'cygwin-mount)
	 (cygwin-mount-activate)
	  )
)
			 
;; ===================================================================
;; 设置个人信息
(setq user-full-name "Cui Yidong")
(setq user-mail-address "nathan.cui@gmail.com")

;; ===================================================================
;; 设置当地经纬度，便于从日历中查到日出日落时间
(setq calendar-latitude 39.55) ;;纬度，正数北纬 
(setq calendar-longitude 116.25) ;;经度，正数东经 
(setq calendar-location-name "Beijing") ;;地名 

;; ===================================================================
;; 启用农历
(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays (append cal-china-x-important-holidays calendar-holidays))


;;++以下内容与显示相关+++++++++++++++++++++++++++++++++++++++++++++++++++++

;; ========================================================
;; 设置emacs启动窗口大小
(setq default-frame-alist
 '((height . 21) (width , 50) (menu-bar-lines . 20) (tool-bar-lines . 0)))

;; ==================================================
;; 设置全屏(fullscreen) ，仅限在Windows操作系统中使用
;;;;; 方法 1：用 emac_fullscreen.exe 配合（放置在Path中的某个目录下）
;;;;;        但是会被windows taskbar挡住
;(defun toggle-full-screen () (interactive) (shell-command "emacs_fullscreen.exe"))
;(if (eq system-type 'windows-nt)
;	(global-set-key [(control f12)] 'toggle-full-screen)
;  )
;; Emacs 24.4 fully supports fullscreen on Windows.
;; Use M-x toggle-frame-fullscreen to toggle it.
(global-set-key [(control f12)] 'toggle-frame-fullscreen)


;; ==================================================
;; no scroll bar, even in x-window system
;;(set-scroll-bar-mode nil)


;; ==================================================
;; 指定系统的各种色彩搭配
;; 相关的配置在 basicPath/lisp/init/init-color-face.el 文件中
;; - 设置系统的 face 或者系统的color-theme。
;; - 设置高亮行的背景
;; - 设置光标颜色
;; - 设置日历颜色
;; - 设置shell的颜色

(load "init-color-face.el")


;; ==================================================
;; Change the default shell from cmd.exe to cygwin
;; (setq shell-file-name "C:/cygwin/bin/zsh.exe")
;; "C:/cygwin/bin/zsh.exe")

(when (eq system-type 'windows-nt)
	(progn
		(setq explicit-shell-file-name "C:/cygwin/bin/zsh.exe")
		(setq shell-file-name "zsh")
;; (setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
		(setenv "SHELL" shell-file-name)
;; remove the input Ctrl-M character
		(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
		(add-to-list 'process-coding-system-alist
			 '("zsh" . (undecided-dos . undecided-unix)))
		)
	)


(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t) 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)
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
;;(require 'rotate-window)
;;(global-set-key (kbd "C-c <up>") 'rotate-window-clockwise)
;;(global-set-key (kbd "C-c <down>") 'rotate-window-anticlockwise)


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
;; 切换到read-only-mode的时候，使用空格翻页
;;   使用 view-mode 即可达到此种效果

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
(defun yes-or-no-p (arg)
  "An alias for y-or-n-p, because I hate having to type 'yes' or 'no'."
  (y-or-n-p arg))

;; 无需确认即关闭当前缓冲区
(global-set-key "\C-xk" 'kill-current-buffer)
(defun kill-current-buffer ()
  "Kill the current buffer, without confirmation."
  (interactive)
  (kill-buffer (current-buffer)))

;; ==================================================
;; Buffer 管理，将 C-x C-b 从Buffer Menu切换为 iBuffer
(global-set-key (kbd "C-x C-b")      'ibuffer)


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
;; ========= Auto Complete 初始化 ==========================
(require 'init-auto-complete)


;; ====================================================
;; set up yasnippet for programming
;; TWO dirs for snippets
;;    1. yas-installed-snippets-dir
;;    2. ~/.emacs.d/snippets
(load "init-yasnippet")

;;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;++各种程序设计语言模式初始化++++++++++++++++++++++++++++++++++++++++++
;; 参见 basicPath/lisp/init/init-programming.el
(load "init-programming")


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


;; ===================================================================
;; 启用ido模式，把备选项直接列出来，你可以输入几个字来缩小
;; 备选范围，也可以用其它键来导航、选择 
;(ido-mode 1)
;(setq ido-enable-flex-matching t)    ;模糊匹配
;; (setq ido-everywhere nil)         ;禁用ido everyting, 拷贝操作不方便
;(setq ido-everywhere t)
;(setq ido-max-directory-size 100000)
;(ido-mode (quote both))

;; ===================================================================
;; 启用 company 模式
(company-mode 1)

;; ===================================================================
;; setup helm
(load "init-helm")

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
;;开启图片浏览(Windows下面，需要一些动态链接库的支持）
;;查看所需库文件的指令是 M-: image-library-alist RET
(require 'thumbs) 
(auto-image-file-mode t)
(image-type-available-p 'png)
   										 
;; ==================================================
;; 去掉每次启动emacs出来的无用的“信息”
(setq inhibit-startup-message t)

;; ==================================================
;; 设置编辑；参见 basePath/lisp/init/init-edit.el
(load "init-edit")

;; ==================================================
;; 设置拷贝 | 粘贴 | 搜索 | 替换；参见 basePath/lisp/init/init-cps.el
(load "init-cps")

;; ==================================================
;; 设置stardict查词
;; ***相关文件安装***请参见 basicPath/lisp/init/init-stardict.el
;(if (eq system-type 'windows-nt)
;	(load "init-stardict")
;  )

;; ===================================================================
;; Org模式初始化
;; 参见 basicPath/lisp/init/init-org.el
(load "init-org")

;; Emacs启动之后，首先显示日程列表
;(add-hook 'window-setup-hook 'split-window-horizontally)
;(add-hook 'window-setup-hook 'org-agenda-list)
;(add-hook 'after-init-hook 'split-window-horizontally)
(add-hook 'after-init-hook
		  (lambda ()
			(split-window-horizontally)
			(next-window)
			(org-agenda-list)))

;; ===================================================================
;; 可以将上次的桌面保存下来，每次重启emacs时自动加载
;; (load "desktop") 
(desktop-save-mode 1)
(savehist-mode 1)
;; emacs启动时，一次加载不超过8个buffer，其它的buffer在emacs idle时再加载
(setq  desktop-restore-eager 5)
;;(desktop-load-default) 
;;(desktop-read) 


;; 让窗口最大化
;(require 'maxframe)
(add-hook 'window-setup-hook 'restore-frame)
(add-hook 'window-setup-hook 'maximize-frame t)
;(add-hook 'after-init-hook 'maximize-frame t)

;; ==================================================
;; obsoleted, for in emacs 24.4 we use eww instead of w3m
;;w3m 
;;(setq w3m-command "~/")
(require 'w3m)
;;;设置w3m为emacs的默认浏览器
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;;(autoload 'w3m-toggle-inline-images "w3m" "set to display images." t)
(global-set-key "\C-xm" 'w3m-goto-url-new-session)

;(setq w3m-use-favicon nil) 
;(setq w3m-command-arguments '("-cookie" "-F")) 
;(setq w3m-use-cookies t) 
;(require 'mime-w3m)

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

;; ==================================================
;; highline 模式设置：将当前行加亮；应放到最后
(load "init-highline")
(highline-mode 1)

;; ==================================================
;; Display an analog clock on screen
;; ~/lisp/mylib/analog-clock.el
(require 'analog-clock)
; Choose if you want a clock with hands, or a
; seven-segment-display by setting `analog-clock-draw-function' to
; `analog-clock-draw-analog' or `analog-clock-draw-ssd'. 
(setq analog-clock-draw-function #'analog-clock-draw-ssd)

;; ==================================================
;; Display an analog clock with svg graph
;; This package needs emacs-25
;;     which has a package "DOM"
;;(require 'svg-clock)

;; ==================================================
;; Document Template
(custom-set-variables '(template-use-package t nil (template)))
