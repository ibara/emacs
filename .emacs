;; This file is in the public domain.

;;
;; Section 1: basic emacs setup stuff
;;

;; Elisp files go in ~/.emacs.d/lisp/
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Powerline
(add-to-list 'load-path "~/.emacs.d/lisp/powerline/")
(require 'powerline)

;; Moe-theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/moe-theme.el/")
(add-to-list 'load-path "~/.emacs.d/lisp/moe-theme.el/")
(require 'moe-theme)
(powerline-moe-theme)
(setq moe-theme-highlight-buffer-id t)
(moe-theme-set-color 'blue)
(moe-dark)

;; Paren-mode
(show-paren-mode t)
(setq show-paren-style 'expression)

;; No splash screen
(setq inhibit-splash-screen t)

;; Line numbers always on, optional fancy separator for terminal
(global-linum-mode 1)
;;(setq linum-format "%5d \u2502 ")
(setq linum-format "%5d ")

;; Highlight current line
(global-hl-line-mode 1)

;; Terminal only: background color should be black
;;(set-background-color "black")
;;(set-foreground-color "white")
;;(set-face-background 'hl-line "#1c1c1c")

;; Get rid of distractions
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Show line and column number in powerline
(line-number-mode 1)
(column-number-mode 1)

;; Date and time
(setq display-time-day-and-date t
      display-time-12hr-format t
      display-time-default-load-average nil
      display-time-mail-file t)
(display-time)

;; Toggle fullscreen with C-M-return
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
					   nil
					 'fullboth)))
(global-set-key [(control meta return)] 'toggle-fullscreen)

;;
;; Section 2: IRC and networking
;;

;; rcirc colored nicks
(eval-after-load 'rcirc '(require 'rcirc-color))
(setq rcirc-colors '("#00cccc" "#33cccc" "#66cccc" "#99cccc" "#00ccff"
		     "#33ccff" "#66ccff" "#99ccff" "#00ff99" "#33ff99"
		     "#66ff99" "#99ff99" "#ccff99" "#00ffcc" "#33ffcc"
		     "#66ffcc" "#99ffcc" "#ccffcc" "#ffffcc" "#00ffff"
		     "#33ffff" "#66ffff" "#99ffff" "#ccffff"))

;; Activity/PM notifications
(add-hook 'rcirc-mode-hook
	  (lambda ()
	    (rcirc-track-minor-mode 1)))

;; Set rcirc nick defaults
(setq rcirc-default-nick "ibara")
(setq rcirc-default-user-name "ibara")
(setq rcirc-default-full-name "ibara")

;; Autojoin #devious
(setq rcirc-server-alist
      '(("irc.freenode.net" :channels ("#devious"))))

;;
;; Section 3: Code writing
;;

;; Proper indentation of C code
(setq c-default-style "bsd"
      c-basic-offset 8)

(setq-default tab-width 8
	      indent-tabs-mode t)

;; Enable Gravity syntax highlighting
(require 'gravity-mode)

;; K
(require 'k-mode)

;; Go
(add-to-list 'load-path "~/.emacs.d/lisp/go-mode.el/")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; Use ag for searching
(require 'ag)
(setq ag-highlight-search t)

;;
;; Section 4: Version control
;;

;; CVS
(require 'pcvs)

;; Mercurial
(require 'mercurial)

;;
;; Section 5: MELPA
;;

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
