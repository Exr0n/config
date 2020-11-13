(add-to-list 'load-path (concat (getenv "XDG_CONFIG_HOME") "dontrun_custom/elegant-emacs/"))
(load "sanity.el")
(load "elegance.el")

(setq mac-command-modifier 'super mac-option-modifier 'meta)

(menu-bar-mode t)

(ido-mode t)
(setq ido-enable-flex-matching t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)

(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

(setq make-backup-files nil)
(setq create-lockfiles nil)
(global-visual-line-mode t)

;;;;;;;;;;;;;;;;;;;;;; keymaps
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-x C-x") 'execute-extended-command)

(global-unset-key (kbd "C-w"))
(global-set-key (kbd "C-w h") 'windmove-left)
(global-set-key (kbd "C-w l") 'windmove-right)
(global-set-key (kbd "C-w k") 'windmove-up)
(global-set-key (kbd "C-w j") 'windmove-down)

(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)
; (global-set-key (kbd "shortcut") 'command)

(setq doc-view-continuous 1)

;;;;;;;;;;;;;;;;;;;;;;; vim bits
; (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line) ; TODO
; (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(require 'evil)
(evil-mode 1)
(evil-ex-define-cmd "q" 'kill-this-buffer)

;; (use-package evil-surround              ; https://github.com/emacs-evil/evil-surround
;;   :ensure t
;;   :config
;;   (global-evil-surround-mode 1))
(global-evil-surround-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil)
 '(package-selected-packages
   '(org-caldav oauth2 use-package smooth-scrolling evil-vimish-fold evil-org)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;; org bits
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-log-done t)
(setq org-agenda-files (list (concat (getenv "CAPSULEROOT") "/org")))
;; (setq org-agenda-files (list "~/Desktop/materials/capsule/org"))

(defun agenda-wrapper ()                ; yoniked from quantumish
  (interactive)
  (org-agenda nil "a")
  (org-agenda-month-view))

(global-set-key (kbd "C-c a") 'agenda-wrapper)

;(require 'org-download-clipboard)

(global-auto-revert-mode t)

; https://emacs.stackexchange.com/a/34660
(add-to-list 'org-structure-template-alist
             '("T" . "#+TITLE:   \n#+AUTHOR: \n\n"))

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

;; org capture
(global-set-key (kbd "C-c c") 'org-capture)

;; package stuff frome https://blog.aaronbieber.com/2015/05/24/from-vim-to-emacs-in-fourteen-days.html
; (unless (package-installed-p 'use-package)
;   (package-refresh-contents)
;   (package-install 'use-package))

;(eval-when-compile
  ;(require 'use-package))

;; (org-return-follows-link t)


(use-package org-roam
      :ensure t
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/Desktop/materials/capsule/org/")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))

;;;;;;;;;;;;;;;;;;;;; org calander import from https://www.ict4g.net/adolfo/notes/emacs/emacs-caldav.html
;; TODO

;; (setq calendars
      ;; '(("canvas" . (getenv "SECRET_CANVAS_CAL") )
        ;; ("calendar2" . "http://.../work.ics")
        ;; ))

(setq calendar-import-location (concat (getenv "CAPSULEROOT") "/org/calendar_import/"))

(defun getcals ()
  "Load a set of ICS calendars into Emacs diary files"
  (interactive)
  (mapcar #'(lambda (x)
              (let ((file (concat calendar-import-location (car x)))
                    (url (cdr x)))
                (message (concat "Loading " url " into " file))
                (find-file file)
                ;; (flush-lines "^[& ]") ;; if you import ical as non marking
                (erase-buffer) ;; to avoid duplicating events
                (getcal url file)
                ))
          calendars))

(setq org-caldav-oauth2-client-id (getenv "SECRET_CALDAV_OAUTH2_CLIENT_ID"))
(setq org-caldav-oauth2-client-secret (getenv "SECRET_CALDAV_OAUTH2_CLIENT_SECRET"))
(setq org-caldav-url 'google)
(setq org-caldav-calender-id (getenv "SECRET_CALDAV_CALENDAR_ID"))

;;;;;;;;;;;;;;;;;;;;; visuals

(global-display-line-numbers-mode t)
(global-display-line-numbers-mode)
(display-line-numbers-mode t)

(global-visual-line-mode 1)
(display-line-numbers-mode 1)

;;;;;;;;;;;;;;;;;;;; dealin w/ windows

(use-package balanced-windows
  :config
  (balanced-windows-mode))

(require 'buffer-move) ; TODO: doesn't work
(global-set-key (kbd "C-S-x C-k") 'buf-move-up)
(global-set-key (kbd "C-S-x C-j") 'buf-move-down)
(global-set-key (kbd "C-S-x C-h") 'buf-move-left)
(global-set-key (kbd "C-S-x C-l") 'buf-move-right)

;;;;;;;;;;;;;;;;;;;;;; editing niceties

(smart-tabs-insinuate 'c 'c++ 'python 'javascript)

(add-to-list 'default-frame-alist '(font . "Hack" ))
(set-face-attribute 'default t :font "Hack" )
(set-face-attribute 'default nil :height 140)
