(defalias 'yes-or-no-p 'y-or-n-p)


;;; color theme
;;; (load "~/cprog/lisp_prog/xemacs-theme.el")

;;
;(require 'hangul) 
;(add-to-list 'load-path "~/.emacs.d/elpa/ox-gfm-20170628.1402")



(add-to-list 'load-path "/home/mjpark/work/org-asciidoc")
(require 'ox-asciidoc)

;;(require 'ox-texinfo)
;;(require 'ox-gfm)

;;(load-theme 'tango)

;;(load-theme 'tango-2)

(add-to-list 'custom-theme-load-path "/home/mjpark/.emacs.d/elpa/dracula-theme-20180416.652")
(load-theme 'dracula t)


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

;(package-refresh-contents)
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

(setq org-archive-mark-done nil)
;(setq org-archive-location "~/Dropbox/orgzly/archive.org::* Archived Tasks")
(setq org-archive-location "~/Dropbox/orgzly/archive.org::")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("eecacf3fb8efc90e6f7478f6143fd168342bbfa261654a754c7d47761cec07c8" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "8abee8a14e028101f90a2d314f1b03bed1cde7fd3f1eb945ada6ffc15b1d7d65" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
