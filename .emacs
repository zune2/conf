

(defalias 'yes-or-no-p 'y-or-n-p)

;;; color theme
(load "~/cprog/lisp_prog/xemacs-theme.el")


;;
;(require 'hangul) 
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
:font fontset
:height 120)
))


;; ELPA
;(require 'package)
;(package-initialize)
;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
)


;; org mode
(setq org-agenda-files '("~/cprog/org_note/note.org"))
(setq org-default-notes-file "~/cprog/org_node/note.org")

(global-set-key (kbd "<f12>") 'org-todo-list)
(global-set-key (kbd "<f11>") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;;; ox-texinfo.el - Texinfo Back-End for Org Export Engine
(load "~/cprog/emacs_practice/ox-texinfo.el")

;;; server.el
;;; (load "~/cprog/emacs_practice/server.el")

