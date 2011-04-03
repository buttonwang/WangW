;;---------------------------------------------------------------------------
;;配置内容：
;;---------------------------------------------------------------------------
;;
;;配置语言环境 
;;配置全屏
;;配置最大化
;;配置color-theme插件，使用更多颜色方案 color-theme-select
;;配置换行 M-x linum-mode
;;配置cedet.el插件，设置C/C++环境
;;配置ecb插件，就是emacs code browser，就是个代码阅览器
;;配置tabbar标签插件
;;配置ido插件
;;配置普通设置
;;配置muse插件
;;---------------------------------------------------------------------------END

;; 首先添加插件路径
(add-to-list 'load-path "E:\\MyEmacs")
(add-to-list 'load-path "E:\\MyEmacs\\color-theme")
(add-to-list 'load-path "E:\\MyEmacs\\cedet\\common")
(add-to-list 'load-path "E:\\MyEmacs\\cedet\\semantic")
(add-to-list 'load-path "E:\\MyEmacs\\ecb")
(add-to-list 'load-path "E:\\MyEmacs\\muse-latest\\lisp")
(add-to-list 'load-path "E:\\MyEmacs\\planner")

;; linux 下的设置
;; Base language setting, Copy from http://forum.ubuntu.org.cn/viewtopic.php?t=40005
;; (set-language-environment 'UTF-8)
;; 設置默認字體，我現在喜歡大一點的字體，養眼。
;; (set-default-font "Bitstream Vera Sans Mono-12")
;; 设置中文字体
;; (set-fontset-font "fontset-default" 'unicode '("WenQuanYi Bitmap Song" . "unicode-bmp"))
;; 将mmm-mode的背景色设深一些，与当前的背景色匹配
;;(set-face-background 'mmm-default-submode-face "DarkBlue")
;; --------------------------------------------------------------------------END

;; 颜色主题 
;(require 'color-theme)
;(color-theme-midnight)
;(color-theme-charcoal-black)
;(color-theme-arjen)
;(color-theme-blippblopp)
;(color-theme-vim-colors)
(require 'color-theme)
 (eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))
	 

;; 语言环境
;;(set-language-environment "Chinese-GB18030")
;;(setq file-name-coding-system 'gb18030)

;; 字体
(setq ascii-font "-outline-Courier New-normal-r-normal-normal-16-97-96-96-c-*-iso8859-1")
(setq chinese-font "-outline-新宋体-normal-r-normal-normal-16-*-96-96-c-*-iso10646-1")
(defun wheer-set-font (en-font cn-font)
  (create-fontset-from-fontset-spec
   (replace-regexp-in-string "iso8859-1" "fontset-wheer" en-font))
  (set-fontset-font "fontset-wheer" 'gb18030 cn-font)
  (set-fontset-font "fontset-wheer" 'latin en-font)
  (set-fontset-font "fontset-default" 'gb18030 cn-font)
  (set-fontset-font "fontset-default" 'latin en-font)
  (set-default-font "fontset-wheer")
  (setq default-frame-alist 
    (append '((font . "fontset-wheer")) default-frame-alist)))
(wheer-set-font ascii-font chinese-font)

;; 行号
(require 'linum)

;; Planner
(require 'planner)

;; cedet 设定
(add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))
(require 'cedet)
(semantic-load-enable-code-helpers)
(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
(define-key-after (lookup-key global-map [menu-bar tools])
  [speedbar]
  '("Speedbar" .
    speedbar-frame-mode)
  [calendar])
(global-set-key [f4] 'speedbar) ;F4切换speedbar
;;;;semantic /usr/include     
(setq semanticdb-search-system-databases t)
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq semanticdb-project-system-databases
                  (list (semanticdb-create-database
          semanticdb-new-database-class
          "/usr/include")))))
;project root path
(setq semanticdb-project-roots
      (list
       (expand-file-name "~/devel")))

;; ecb设置
(require 'ecb)

(require 'ecb-autoloads)
(setq ecb-auto-activate t
      ecb-tip-of-the-day nil
      inhibit-startup-message t
      ecb-auto-compatibility-check nil
      ecb-version-check nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(ecb-layout-window-sizes (quote (("left8" (0.20967741935483872 . 0.27586206896551724) (0.20967741935483872 . 0.2413793103448276) (0.20967741935483872 . 0.27586206896551724) (0.20967741935483872 . 0.1724137931034483)))))
 '(ecb-options-version "2.32")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(load-home-init-file t t)
 '(muse-html-charset-default "utf-8")
 '(muse-html-encoding-default (quote utf-8))
 '(muse-html-meta-content-encoding (quote utf-8))
 '(show-paren-mode t)
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; scroll other window
(global-set-key (kbd "C-c C-v") 'scroll-other-window)
(global-set-key (kbd "C-c C-b") 'scroll-other-window-down) 

;; 設置環境
;; (global-set-key (kbd "C-SPC") 'nil)

	   
	   
;; 配置普通设置 
;; 以下有些設置的作用記不清了，以後慢慢補回吧。
(setq inhibit-startup-message t) ; 关闭起动时闪屏 
(global-font-lock-mode t) ; 语法高亮 
(auto-image-file-mode t)  ; 打开图片显示功能
(fset 'yes-or-no-p 'y-or-n-p) ;将yes/no替换为y/n
(column-number-mode t) ; 显示列号
(show-paren-mode t)    ; 显示括号匹配 
(display-time-mode 1)  ; 显示时间
(setq display-time-24hr-format t) ; 24小时格式
(setq display-time-day-and-date t) ; 显示日期
(mouse-avoidance-mode 'animate) ; 光标移动到鼠标下时，鼠标自动弹开
(transient-mark-mode t)  ; 高亮要拷贝的区域 
(setq mouse-yank-at-point t) ; 支持中键粘贴
(setq x-select-enable-clipboard t) ; 支持emacs和外部程序的粘贴 
(setq x-select-enable-clipboard t)
(setq frame-title-format "Button Wang@%b") ; 显示当前编辑的文档
(setq default-fill-column 80) ; 默认显示 80列就换行 
(setq default-tab-width 4)
;; (tool-bar-mode nil) ; 去掉那个大大的工具栏
(scroll-bar-mode nil) ; 去掉滚动条，因为可以使用鼠标滚轮了 
;; -------------------------------------------END

;; 设置tabbar
(require 'tabbar)
(tabbar-mode t)
;;(tabbar-mode)
(global-set-key (kbd "C-=") 'tabbar-backward-group);;这几句的目的是绑定快捷键
(global-set-key (kbd "C--") 'tabbar-forward-group);;不过没有发现有很大用处，所以注释了。
(global-set-key (kbd "C-0") 'tabbar-backward)
(global-set-key (kbd "C-9") 'tabbar-forward)
;;---------------------------------------------------------------------------------------- 

;; Haskell mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; set Python mode
;; 代码折叠设置来自 gb@cs.unc.edu， 感谢他。
(add-hook 'python-mode-hook 'python-mode-hook t)

(defun py-outline-level ()
  (let (buffer-invisibility-spec)
	(save-excursion
	  (skip-chars-forward "\t ")
	  (current-column))))

(defun python-mode-hook ()
  ; this gets called by outline to deteremine the level. Just use the length of the whitespace
  (custom-set-variables
	'(indent-tabs-mode nil)
	'(tab-width 4)
	'(tab-stop-list nil)
	)
  (linum-mode t)
  ; outline uses this regexp to find headers. I match lines with no indent and indented "class"
  ; and "def" lines.
  ; 这里我利用了 Martin Sand Christensen 提供的正则表达式，感谢他。
  (setq outline-regexp "[^ \t]\\|[ \t]*\\(def\\|class\\|if\\|elif\\|else\\|while\\|for\\|try\\|except\\|finally|with\\) ")
  ; enable our level computation
  (setq outline-level 'py-outline-level)
  ; turn on outline mode
  (outline-minor-mode t)
  ; make paren matches visible
  (show-paren-mode 1)
)

;; Perl6 Support
;; (defalias 'perl-mode 'cperl-mode)
(autoload 'cperl-mode "cperl-mode" "alternate mode for editing Perl programs" t)

;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(add-hook 'cperl-mode-hook 'cperl-mode-hook t)
(defun cperl-mode-hook ()
  (setq cperl-continued-statement-offset 0)
  (setq cperl-extra-newline-before-brace t)
;;  (set-face-background 'cperl-array-face "wheat")
;;  (set-face-background 'cperl-hash-face "wheat")
  (cperl-set-style "CPerl")
  (setq cperl-indent-level 4)
  (linum-mode t)
)

;; Emacs Muse
;; (load "muse-init")
(require 'muse-mode)     ; load authoring mode
(require 'muse-html)     ; load publishing styles I use
(require 'muse-latex)
(require 'muse-texinfo)
(require 'muse-docbook)
(require 'muse-project)
(require 'muse-wiki)
(require 'muse-book)

(setq muse-project-alist
       '(("Website" ("E:\\MyMuse" :default "index")
          (:base "html" :path "public_html/muse")
          (:base "pdf"  :path "public_pdf/muse")
          ))
)

(put 'upcase-region 'disabled nil)

; insert-date
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%Y年%m月%e日 星期%a %p %l:%M")))

;; psvn
(require 'psvn)

;; docbook
(require 'docbook-xml-mode)

;; Mercrial
;; (add-to-list 'load-path "~/site-lisp/mercurial")
;; (require 'mercurial)

;; django setting
(require 'django-html-mode)

;;  css setting
(add-hook 'css-mode-hook 
		  '(lambda()
			 (custom-set-variables
			  '(indent-tabs-mode nil)
			  '(tab-width 4))
			 ))

;; javascript mode
(autoload 'javascript-mode "javascript" nil t)

;; MoinMoin setting
(require 'moinmoin-mode)

;; regex-tool.el
(load "regex-tool" t)
(setq regex-tool-perl-path "~/perl-5.10/bin/perl")

