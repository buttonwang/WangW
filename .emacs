;;---------------------------------------------------------------------------
;;�������ݣ�
;;---------------------------------------------------------------------------
;;
;;�������Ի��� 
;;����ȫ��
;;�������
;;����color-theme�����ʹ�ø�����ɫ���� color-theme-select
;;���û��� M-x linum-mode
;;����cedet.el���������C/C++����
;;����ecb���������emacs code browser�����Ǹ�����������
;;����tabbar��ǩ���
;;����ido���
;;������ͨ����
;;����muse���
;;---------------------------------------------------------------------------END

;; ������Ӳ��·��
(add-to-list 'load-path "E:\\MyEmacs")
(add-to-list 'load-path "E:\\MyEmacs\\color-theme")
(add-to-list 'load-path "E:\\MyEmacs\\cedet\\common")
(add-to-list 'load-path "E:\\MyEmacs\\cedet\\semantic")
(add-to-list 'load-path "E:\\MyEmacs\\ecb")
(add-to-list 'load-path "E:\\MyEmacs\\muse-latest\\lisp")
(add-to-list 'load-path "E:\\MyEmacs\\planner")

;; linux �µ�����
;; Base language setting, Copy from http://forum.ubuntu.org.cn/viewtopic.php?t=40005
;; (set-language-environment 'UTF-8)
;; �O��Ĭ�J���w���ҬF��ϲ�g��һ�c�����w���B�ۡ�
;; (set-default-font "Bitstream Vera Sans Mono-12")
;; ������������
;; (set-fontset-font "fontset-default" 'unicode '("WenQuanYi Bitmap Song" . "unicode-bmp"))
;; ��mmm-mode�ı���ɫ����һЩ���뵱ǰ�ı���ɫƥ��
;;(set-face-background 'mmm-default-submode-face "DarkBlue")
;; --------------------------------------------------------------------------END

;; ��ɫ���� 
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
	 

;; ���Ի���
;;(set-language-environment "Chinese-GB18030")
;;(setq file-name-coding-system 'gb18030)

;; ����
(setq ascii-font "-outline-Courier New-normal-r-normal-normal-16-97-96-96-c-*-iso8859-1")
(setq chinese-font "-outline-������-normal-r-normal-normal-16-*-96-96-c-*-iso10646-1")
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

;; �к�
(require 'linum)

;; Planner
(require 'planner)

;; cedet �趨
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
(global-set-key [f4] 'speedbar) ;F4�л�speedbar
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

;; ecb����
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

;; �O�íh��
;; (global-set-key (kbd "C-SPC") 'nil)

	   
	   
;; ������ͨ���� 
;; ������Щ�O�õ�����ӛ�����ˣ����������a�ذɡ�
(setq inhibit-startup-message t) ; �ر���ʱ���� 
(global-font-lock-mode t) ; �﷨���� 
(auto-image-file-mode t)  ; ��ͼƬ��ʾ����
(fset 'yes-or-no-p 'y-or-n-p) ;��yes/no�滻Ϊy/n
(column-number-mode t) ; ��ʾ�к�
(show-paren-mode t)    ; ��ʾ����ƥ�� 
(display-time-mode 1)  ; ��ʾʱ��
(setq display-time-24hr-format t) ; 24Сʱ��ʽ
(setq display-time-day-and-date t) ; ��ʾ����
(mouse-avoidance-mode 'animate) ; ����ƶ��������ʱ������Զ�����
(transient-mark-mode t)  ; ����Ҫ���������� 
(setq mouse-yank-at-point t) ; ֧���м�ճ��
(setq x-select-enable-clipboard t) ; ֧��emacs���ⲿ�����ճ�� 
(setq x-select-enable-clipboard t)
(setq frame-title-format "Button Wang@%b") ; ��ʾ��ǰ�༭���ĵ�
(setq default-fill-column 80) ; Ĭ����ʾ 80�оͻ��� 
(setq default-tab-width 4)
;; (tool-bar-mode nil) ; ȥ���Ǹ����Ĺ�����
(scroll-bar-mode nil) ; ȥ������������Ϊ����ʹ���������� 
;; -------------------------------------------END

;; ����tabbar
(require 'tabbar)
(tabbar-mode t)
;;(tabbar-mode)
(global-set-key (kbd "C-=") 'tabbar-backward-group);;�⼸���Ŀ���ǰ󶨿�ݼ�
(global-set-key (kbd "C--") 'tabbar-forward-group);;����û�з����кܴ��ô�������ע���ˡ�
(global-set-key (kbd "C-0") 'tabbar-backward)
(global-set-key (kbd "C-9") 'tabbar-forward)
;;---------------------------------------------------------------------------------------- 

;; Haskell mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; set Python mode
;; �����۵��������� gb@cs.unc.edu�� ��л����
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
  ; ������������ Martin Sand Christensen �ṩ��������ʽ����л����
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
  (insert (format-time-string "%Y��%m��%e�� ����%a %p %l:%M")))

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

