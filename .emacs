;; This file is in the public domain.

;; Section 1: basic emacs setup stuff

;; Elisp files go in ~/.emacs.d/lisp/
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/moe-theme.el/")
(add-to-list 'load-path "~/.emacs.d/lisp/moe-theme.el/")
(require 'moe-theme)
(moe-dark)
(moe-theme-set-color 'blue)
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
;;(set-face-background 'hl-line "#1c1c1c")

;; Background color should be black
;;(set-background-color "black")
;;(set-foreground-color "white")

;; Get rid of distractions
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Show line and column number in mode line
(line-number-mode 1)
(column-number-mode 1)

;; Date and time
(setq display-time-day-and-date t
      display-time-12hr-format t
      display-time-default-load-average nil
      display-time-mail-file t)
(display-time)

;; Section 2: IRC and networking

;; rcirc colored nicks
(eval-after-load 'rcirc '(require 'rcirc-color))
(setq rcirc-colors '("#800000" "#008000" "#800080" "#008080" "#ff00ff" "#00ffff"
		     "#d78700" "#d7ffd7" "#6c6c6c"))

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

;; Section 3: Other things

;; Toggle fullscreen with C-M-return
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
					   nil
					 'fullboth)))
(global-set-key [(control meta return)] 'toggle-fullscreen)

;; Use ag for searching
(require 'ag)
(setq ag-highlight-search t)
