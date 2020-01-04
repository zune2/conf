(defalias 'yes-or-no-p 'y-or-n-p)

(setq inhibit-startup-screen t)

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files


;(require 'hangul) 
;(add-to-list 'load-path "~/.emacs.d/elpa/ox-gfm-20170628.1402")
(setq-default c-basic-offset 8)

;; fontify code in code blocks
(setq org-src-fontify-natively t)

(add-to-list 'load-path "/home/mjpark/work/org-asciidoc")
(require 'ox-asciidoc)
:
;(require 'ox-texinfo)
;(require 'ox-gfm)
;(load-theme 'tango)
;(load-theme 'tango-2)


;(add-to-list 'custom-theme-load-path "/home/mjpark/.emacs.d/elpa/dracula-theme-20180416.652")
;(load-theme 'dracula t)

;(load-theme color-theme-vim-colors)

(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
(global-set-key (kbd "<S-kana>") 'toggle-input-method)
(global-set-key (kbd "<kana>") 'toggle-input-method)

(defun xftp (&optional frame)
"Return t if FRAME support XFT font backend."
(let ((xft-supported))
(mapc (lambda (x) (if (eq x 'xft) (setq xft-supported t)))
(frame-parameter frame 'font-backend))
xft-supported))
(when (xftp)
(let ((fontset "fontset-default"))
(set-default-font "Inconsolata")
(set-face-font 'default "Inconsolata")
(set-fontset-font fontset 'hangul
'("NanumGothic" . "unicode-bmp"))
(set-face-attribute 'default nil
font fontset
:height 120)
))

;; ELPA
;; Package system
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))


;;(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;			 ("marmalade" . "https://marmalade-repo.org/packages/")
;;			 ("melpa" . "http://melpa.org/packages/")
;;			 ("user42" . "http://download.tuxfamily.org/user42/elpa/packages/")))
(package-initialize)
;;(package-refresh-contents)
;(setq auto-install-packages
;      '(color-theme bar-cursor htmlize flycheck flycheck-haskell
;		    haskell-mode sml-mode rust-mode fsharp-mode nasm-mode go-mode
;		    perl-mode web-mode )) ;;ffap-perl-module markdown-mode))
;(dolist (pkg auto-install-packages)
;  (unless (package-installed-p pkg)
;        (package-install pkg)))

;(when (>= emacs-major-version 24)
;  (require 'package)
;  (package-initialize)
;  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
;)

;; org mode
;(setq org-default-notes-file "~/cprog/org_note/note.org")
; org-agenda file에 추가될 file을 순서대로 기록할 수 있다.
;(setq org-agenda-files '("~/cprog/org_note/note.org") '("/home/mjpark/Dropbox/orgzly
;"))

(setq org-agenda-files
         '("/home/mjpark/Dropbox/orgzly"))

(global-set-key (kbd "<f12>") 'org-todo-list)
(global-set-key (kbd "<f11>") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;(setq org-archive-mark-done nil)
;;(setq org-archive-location "~/Dropbox/orgzly/archive.org::* Archived Tasks")
(setq org-archive-location "~/Dropbox/orgzly/archive.org::")

;; C-x C-w : refile
(setq org-refile-targets '(("archive.org" :level . 1)))

;(use-package org-bullets
;  :ensure t
;  :init
;  (setq org-bullets-bullet-list
;	'("◉" "◎" "⚫" "○" "►" "◇"))
;  :config
;  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Run C Program directly from within Emacs
(defun build-c-run ()
  (interactive)
  (defvar foo)
 (setq foo (concat "g++ -g " (buffer-name) " && ./a.out"))
  (shell-command foo))

(global-set-key (kbd "<f12>") 'org-todo-list)
;;(global-set-key [C-f1] 'build-c-run)
(global-set-key (kbd "<f9>") 'build-c-run)
;;(global-set-key "\C-x\C-m" 'build-c-run)

(defun linux-c-mode ()                                                                                      "C mode with adjusted defaults for use with the Linux kernel."
       (interactive)
       (c-mode)
       (c-set-style "K&R")
       (setq c-basic-offset 8))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . nil)
      (C . t)))

(load-theme 'tangotango t)

(setq org-refile-targets
      '(("SwCert.org" :maxlevel . 1)
        ))

(setq browse-url-browser-function 'browse-url-generic
            browse-url-generic-program "google-chrome")
