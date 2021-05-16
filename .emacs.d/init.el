;; things TODO before I can daily drive emacs: vim-like foldmethod=manual with nesting
;; other niceties: smart tabs, invisible characters, find-file recursively, ivy-swiper,  lsp, ligatures, rename support, show documentation, calendar to emacs https://opensource.com/article/20/1/emacs-mail-calendar
;; snippets : yasnippet, see discord for example
;; packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(require 'use-package)

(add-to-list 'load-path "~/.emacs.d/autoload")
(load "olivetti.el")

(require 'smart-tabs-mode)
(smart-tabs-insinuate 'c 'c++ 'javascript 'python)

;; (require 'aggressive-indent)
;; (global-aggressive-indent-mode 1)
;; (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;; keybinds
(global-set-key (kbd "C-S-v") 'clipboard-yank)
(global-set-key (kbd "C-S-c") 'clipboard-kill-ring-save)

;;; clipboard (except keybinds, see keybind section)
(setq x-select-enable-clipboard nil) ; don't touch external clipboard, from https://stackoverflow.com/a/24209883

;; evil
(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(setq evil-want-keybinding nil)
(require 'evil)
(when (require 'evil-collection nil t)
  (evil-collection-init))
(evil-mode 1)

;; editing
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(require 'undo-tree)

;; (require 'smartparens-config)
;; (smartparens-global-mode t)

;; (require 'smooth-scrolling)				; slow, apparently https://www.reddit.com/r/emacs/comments/3kgv75/why_is_smooth_scrolling_so_slow/cuxk3a3?utm_source=share&utm_medium=web2x&context=3
;; (smooth-scrolling-mode 1)
(setq scroll-conservatively 101) ;; move minimum when cursor exits view, instead of recentering
(setq mouse-wheel-scroll-amount '(1)) ;; mouse scroll moves 1 line at a time, instead of 5 lines
(setq mouse-wheel-progressive-speed nil) ;; on a long mouse scroll keep scrolling by 1 line
;; (require 'fast-scroll)			   ; TODO: broken
;; (setq fast-scroll-throttle 0.1)

; olivetti
(add-hook 'prog-mode-hook  (lambda ()
						   (olivetti-mode 1)
							(olivetti-set-width 120)
						   ))

;;; large files (vlf)
(require 'vlf-setup)
(setq vc-handled-backends nil)			; apparently helps with save performance

;; git
(require 'magit)
(global-git-gutter-mode +1)
(add-hook 'prog-mode-hook 'git-gutter-mode)

;; background
(setq make-backup-files nil)
(setq create-lockfiles nil)
(global-auto-revert-mode t)
;; workgroups
;; (require 'workgroups2); TODO: FIX

;; LSP
;; if you want to change prefix for lsp-mode keybindings.
(setq lsp-keymap-prefix "M-l")

(require 'lsp-mode)
(add-hook 'c-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'lisp-mode-hook #'lsp)
(add-hook 'python-mode-hook #'lsp)
(add-hook 'javascript-mode-hook #'lsp)

(require 'lsp-ui)
(setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-delay 0)

;; completion
(require 'company)
(require 'company-lsp)
(push 'company-lsp company-backends)

;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a3b6a3708c6692674196266aad1cb19188a6da7b4f961e1369a68f06577afa16" default))
 '(fast-scroll-mode t)
 '(global-auto-revert-mode t)
 '(highlight-indent-guides-method 'character)
 '(org-agenda-files
   '("~/projects/Taproot/2020ISOS101/KBe21isos201retStoryOfScienceComputationalComplexity.org" "~/projects/Taproot/21math401/KBe21math401retHandout24EvaluatingDefiniteIntegrals.org" "~/org/schoolwork_ibx.org" "~/org/usaypt2021/ypt2021_chain_ibx.org" "~/org/config_ibx.org" "~/org/projects_ibx.org" "~/materials/capsule/org/inbox.org" "~/org/networking_ibx.org" "~/pass/quizes/21math530/quiz_review.org" "~/org/stepup/seec/general_action_items.org"))
 '(org-latex-default-packages-alist
   '(("AUTO" "inputenc" t
	  ("pdflatex"))
	 ("T1" "fontenc" t
	  ("pdflatex"))
	 ("" "graphicx" t nil)
	 ("" "grffile" t nil)
	 ("" "longtable" nil nil)
	 ("" "wrapfig" nil nil)
	 ("" "rotating" nil nil)
	 ("normalem" "ulem" t nil)
	 ("" "amsmath" t nil)
	 ("" "textcomp" t nil)
	 ("" "amssymb" t nil)
	 ("" "capt-of" nil nil)
	 ("" "hyperref" nil nil)))
 '(org-latex-packages-alist '(("" "cancel" t) ("" "physics" t)))
 '(package-selected-packages
   '(rainbow-mode flyspell-correct-ivy org-fragtog hl-todo laas evil-smartparens yasnippet aas activity-watch-mode request focus company-lsp company all-the-icons-ivy-rich treemacs-all-the-icons lsp-ivy lsp-treemacs flycheck lsp-ui lsp-mode fast-scroll evil-collection async olivetti highlight-indent-guides git-gutter magit counsel-fd swiper vlf evil-org use-package undo-tree aggressive-indent smart-tabs-mode evil-vimish-fold evil-surround workgroups2 smooth-scrolling doom-modeline ivy doom-themes evil))
 '(smartparens-global-mode nil)
 '(vlf-application 'dont-ask)
 '(warning-suppress-log-types '((use-package)))
 '(warning-suppress-types '((use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-ui-sideline-symbol-info ((t (:extend t :background "#1e1c31" :foreground "#4d4c6a")))))

;; ability to redo things
(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)

(require 'vimish-fold)
(require 'evil-vimish-fold)
(global-evil-vimish-fold-mode 1)

;; ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; (setq ivy-re-builders-alist ; TODO https://oremacs.com/2016/01/06/ivy-flx/
;;       '((ivy-switch-buffer . ivy--regex-plus)
;;         (t . ivy--regex-fuzzy)))
;; (swiper-mode 1)
;; (global-set-key (kbd "C-x C-f") (ivy-read "File: " (directory-files-recursively default-directory "~"))) ; https://emacs.stackexchange.com/a/32864
(counsel-mode 1)

;; gui
(global-display-line-numbers-mode t)
(setq display-line-numbers-width-start t)
(defun display-line-numbers-equalize ()
  "Equalize The width, ala https://emacs.stackexchange.com/a/55166"
  (setq display-line-numbers-width (length (number-to-string (line-number-at-pos (point-max))))))
(add-hook 'find-file-hook 'display-line-numbers-equalize)

;; indent guides
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;;; font
(set-face-attribute 'default nil :height 220)
(set-face-attribute 'default t :font "Iosevka Term SS12" :weight 'light)
;; (set-face-attribute 'default t :font "Iosevka Term SS12" :weight 'light)
;; (set-face-attribute 'default t :font "Hack Nerd Font" :weight 'light)
;; (set-face-attribute 'default t :font "Roboto Mono" :weight 'light)
;; (set-face-attribute 'default t :font "Iosevka Nerd Font Mono:light") ; TODO: nerd font

;;; remove bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-visual-line-mode 1)

;;; modeline
(use-package doom-modeline
             :ensure t
             :init (doom-modeline-mode 1))

;;; colors
(use-package rainbow-delimiters
             :config
	         (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
	         (add-hook 'org-mode-hook 'rainbow-delimeters-mode))

(use-package hl-todo-mode
             :config
             (add-hook 'prog-mode-hook 'hl-todo-mode))


;; (load-theme 'doom-challenger-deep)
(use-package doom-themes
			 :config
			 ;; Global settings (defaults)
			 (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
				   doom-themes-enable-italic t) ; if nil, italics is universally disabled
			 (load-theme 'doom-challenger-deep t)

			 ;; Enable flashing mode-line on errors
			 (doom-themes-visual-bell-config)

			 ;; Enable custom neotree theme (all-the-icons must be installed!)
			 (doom-themes-neotree-config)
			 ;; or for treemacs users
			 (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
			 (doom-themes-treemacs-config)

			 ;; Corrects (and improves) org-mode's native fontification.
			 (doom-themes-org-config))

;; org
(require 'org)
(setq org-log-done t)
(defun agenda-wrapper ()                ; yoniked from quantumish
  (interactive)
  (org-agenda nil "a")
  (org-agenda-month-view)
  (visual-line-mode -1))
(global-set-key (kbd "C-c a") 'agenda-wrapper)
(global-set-key (kbd "C-c t") 'org-todo-list)

(add-hook 'org-agenda-mode-hook	; superuser.com/a/531670
		  (lambda ()
			(visual-line-mode -1)))

(add-hook 'org-mode-hook  (lambda ()
							(olivetti-set-width 120)
							(olivetti-mode 1)
							(olivetti-set-width 120)
						   ))

(add-hook 'org-mode-hook  (lambda ()
							(flyspell-mode t)))
;; start at inbox
(setq initial-buffer-choice (concat (getenv "HOME") "/materials/capsule/org/inbox.org"))

;; evil things
(use-package evil-org		; https://github.com/Somelauw/evil-org-mode
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
			(lambda ()
			  (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package evil-surround              ; https://github.com/emacs-evil/evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))
(global-evil-surround-mode 1)

(with-eval-after-load 'evil-maps ; https://emacs.stackexchange.com/questions/46371/how-can-i-get-ret-to-follow-org-mode-links-when-using-evil-mode
  (define-key evil-motion-state-map (kbd "SPC") nil)
  (define-key evil-motion-state-map (kbd "RET") nil)
  (define-key evil-motion-state-map (kbd "TAB") nil))
(setq org-return-follows-link t)

;; org capture
(global-set-key (kbd "C-c c") 'org-capture)

;; org + latex
(setq org-format-latex-options (plist-put org-format-latex-options :scale 3.0))

; manual hooks because prev doesn't seem to be working
(add-hook 'org-mode-hook 'laas-mode)
(add-hook 'org-mode-hook 'org-fragtog-mode)

;; (use-package laas)
; NOTE: customize org latex headers with describe-variable org-latex-packages-alist
(require 'yasnippet)
(yas-global-mode 1)

(use-package math-at-point
  :load-path "autoload/math-at-point"
  :ensure nil
  :bind ("C-x C-z" . math-at-point))

(use-package laas
  :config ; do whatever here
  (aas-set-snippets 'laas-mode
					":B" (lambda () (interactive)
						   (yas-expand-snippet "\\boxed{\\text{$1}}$0"))
					":M" (lambda () (interactive)
						   (yas-expand-snippet "\n\\[\\begin{aligned}\n    $1\n\\end{aligned}\\]\n$0"))
					":m" (lambda () (interactive)
						   ;; (yas-expand-snippet "\\( $1 \\)$0"))
						   (yas-expand-snippet "\$$1\$$0"))
					";m" (lambda () (interactive)
						   (yas-expand-snippet "\( $1 \)$0"))
                    ;; set condition!
                    :cond #'texmathp ; expand only while in math
                    "supp" "\\supp"
                    "On" "O(n)"
                    "O1" "O(1)"
                    "Olog" "O(\\log n)"
                    "Olon" "O(n \\log n)"

					"tr " "^\\top "

					" pi " " \\pi "
					";;t" "\\theta"
					";T" "\\Tau"

					" ;c " " \\subseteq "
					" ;C " " \\subsetneq "

					" nn" " \\left("
					"ss " "\\right) "

					" FF" " \\mathbb{F}"
					" CC" " \\mathbb{C}"
					" RR" " \\mathbb{R}"
					" NN" " \\mathbb{N}"
					" ZZ" " \\mathbb{Z}"
					" QQ" " \\mathbb{Q}"
					" HH" " \\mathbb{H}"
					" PP" " \\mathbb{P}"

					" Pp" " \\mathcal{P}"
					" Ll" " \\mathcal{L}"
					" Mm" " \\mathcal{M}"
					" Dd" " \\mathcal{M}"

					" inf " " \\infty"

					" sin " " \\sin "
					" cos " " \\cos "
					" tan " " \\tan "
					" cot " " \\cot "
					" sec " " \\sec "
					" csc " " \\csc "

					":Q"     (lambda () (interactive)
							   (yas-expand-snippet "\\sqrt{$1}$0"))
					":C"     (lambda () (interactive)
							   (yas-expand-snippet "\\cancel{$1}$0"))
					":c"     (lambda () (interactive)
							   (yas-expand-snippet "\\cancelto{$1}{$2}$0"))
					":V"     (lambda () (interactive)
							   (yas-expand-snippet "\\lVert $1 \\rVert$0"))
					":/"     (lambda () (interactive)
							   (yas-expand-snippet "\\frac{$1}{$2}$0"))
					":b"     (lambda () (interactive)
							   (yas-expand-snippet "\\boxed{$1}$0"))
					" tt"    (lambda () (interactive)
							   (yas-expand-snippet " \\begin{$1}$2\\end{$1}$0"))
					" hh"    (lambda () (interactive)
							   (yas-expand-snippet " \\left$1\\right$1 $0"))
					" sum "  (lambda () (interactive)
							   (yas-expand-snippet " \\sum_{$1}^{$2} $0"))
					" lim "  (lambda () (interactive)
							   (yas-expand-snippet " \\lim_{$1} $0"))
					" int "  (lambda () (interactive)
							   (yas-expand-snippet " \\int $1 dx $2$0"))
					" dint " (lambda () (interactive)
							   (yas-expand-snippet " \\int_{$1}^{$2} $3 dx$0"))
					" :t"    (lambda () (interactive)
							   (yas-expand-snippet " \\text{$1}$0"))

					" ang "    (lambda () (interactive)
							   (yas-expand-snippet " \\langle $1 \\rangle$0"))

					;; bind to functions!
                    ;; "//" (lambda () (interactive)
                    ;;          (yas-expand-snippet "\\frac{$1}{$2}$0"))
                    ;; "Span" (lambda () (interactive)
                    ;;          (yas-expand-snippet "\\Span($1)$0"))))
					))

;; activitywatch and other meta time tracking things
(global-activity-watch-mode)

(server-start)
