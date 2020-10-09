(add-to-list 'load-path "/Users/exr0n/.config/dontrun_custom/elegant-emacs/")
(load "sanity.el")
(load "elegance.el")

(setq mac-command-modifier 'super mac-option-modifier 'meta)

(ido-mode t)
(setq ido-enable-flex-matching t)

(setq-default tab-width 4)
(setq-default c-basic-offset 4)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-x C-x") 'execute-extended-command)

(global-set-key (kbd "C-h") 'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-k") 'windmove-up)
(global-set-key (kbd "C-j") 'windmove-down)

(smooth-scrolling-mode)

(setq make-backup-files nil)

(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)
; (global-set-key (kbd "shortcut") 'command)

(require 'evil)
(evil-mode 1)
(evil-ex-define-cmd "q" 'kill-this-buffer)

; https://github.com/Somelauw/evil-org-mode
(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

;; (use-package evil-org
;;   :ensure t
;;   :after org
;;   :config
;;   (add-hook 'org-mode-hook 'evil-org-mode)
;;   (add-hook 'evil-org-mode-hook
;;             (lambda ()
;;               (evil-org-set-key-theme)))
;;   (require 'evil-org-agenda)
;;   (evil-org-agenda-set-keys))

(global-visual-line-mode 1)

(display-line-numbers-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil)
 '(package-selected-packages '(use-package smooth-scrolling evil-vimish-fold evil-org)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(require 'org-download-clipboard)

(global-auto-revert-mode t)

; https://emacs.stackexchange.com/a/34660
(add-to-list 'org-structure-template-alist
             '("T" "#+TITLE:   \n#+AUTHOR: html-postamble:nil whn:nil toc:nil nav:nil\n#+HTML_HEAD:\n#+HTML_HEAD_EXTRA:\n\n? "))

;; package stuff frome https://blog.aaronbieber.com/2015/05/24/from-vim-to-emacs-in-fourteen-days.html 
; (unless (package-installed-p 'use-package)
;   (package-refresh-contents)
;   (package-install 'use-package))

;(eval-when-compile
  ;(require 'use-package))

(global-display-line-numbers-mode)
