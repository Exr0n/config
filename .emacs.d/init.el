;; things TODO before I can daily drive emacs: vim-like foldmethod=manual with nesting, https://www.reddit.com/r/emacs/comments/8pfdlb/weird_shifting_problem_with_new_emacs_line_numbers/
;; other niceties: figure out how indenting works, smart tabs, indent lines, invisible characters
;; packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require 'smart-tabs-mode)
(smart-tabs-insinuate 'c 'c++ 'javascript 'python)
(require 'aggressive-indent)
(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;; keybinds
(global-set-key (kbd "C-S-v") 'x-clipboard-yank)

;;; clipboard (except keybinds, see keybind section)
(setq x-select-enable-clipboard nil) ; don't touch external clipboard, from https://stackoverflow.com/a/24209883

;; editing TODO what got delete from here again?
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(require 'undo-tree)

(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

;; background
(setq make-backup-files nil)
(setq create-lockfiles nil)
;; workgroups
					; (require 'workgroups2); TODO: FIX

;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a3b6a3708c6692674196266aad1cb19188a6da7b4f961e1369a68f06577afa16" default))
 '(package-selected-packages
   '(undo-tree aggressive-indent smart-tabs-mode evil-vimish-fold vimish-fold evil-surround workgroups2 smooth-scrolling doom-modeline ivy doom-themes evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; evil
(require 'evil)
(evil-mode 1)

;; ability to redo things
(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)

(require 'vimish-fold)
(require 'evil-vimish-fold)
(global-evil-vimish-fold-mode 1)

;; (use-package evil-surround              ; https://github.com/emacs-evil/evil-surround
;;   :ensure t
;;   :config
;;   (global-evil-surround-mode 1))
;; (global-evil-surround-mode 1)

;; ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; (setq ivy-re-builders-alist ; TODO https://oremacs.com/2016/01/06/ivy-flx/
;;       '((ivy-switch-buffer . ivy--regex-plus)
;;         (t . ivy--regex-fuzzy)))

;; gui
(global-display-line-numbers-mode t)

;;; font
(set-face-attribute 'default nil :height 180)
(set-face-attribute 'default t :font "Iosevka")

;;; remove bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;; modeline
(require 'doom-modeline)
(doom-modeline-mode 1)

;;; colors
(load-theme 'doom-challenger-deep)
;(use-package doom-themes
;             :config
;             ;; Global settings (defaults)
;             (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;                   doom-themes-enable-italic t) ; if nil, italics is universally disabled
;             (load-theme 'doom-one t)
;
;             ;; Enable flashing mode-line on errors
;             (doom-themes-visual-bell-config)
;
;             ;; Enable custom neotree theme (all-the-icons must be installed!)
;             (doom-themes-neotree-config)
;             ;; or for treemacs users
;             (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
;             (doom-themes-treemacs-config)
;
;             ;; Corrects (and improves) org-mode's native fontification.
;             (doom-themes-org-config))

;; start at inbox
(setq initial-buffer-choice (concat (getenv "HOME") "/materials/capsule/org/inbox.org"))

(server-start)
