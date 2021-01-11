;;; evil-vimish-fold-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "evil-vimish-fold" "../../../../.emacs.d/elpa/evil-vimish-fold-20200122.117/evil-vimish-fold.el"
;;;;;;  "9095f4dfa155350b762668783c238e74")
;;; Generated autoloads from ../../../../.emacs.d/elpa/evil-vimish-fold-20200122.117/evil-vimish-fold.el

(autoload 'evil-vimish-fold-mode "evil-vimish-fold" "\
Evil-vimish-fold-mode.

If called interactively, enable Evil-Vimish-Fold mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(put 'global-evil-vimish-fold-mode 'globalized-minor-mode t)

(defvar global-evil-vimish-fold-mode nil "\
Non-nil if Global Evil-Vimish-Fold mode is enabled.
See the `global-evil-vimish-fold-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-evil-vimish-fold-mode'.")

(custom-autoload 'global-evil-vimish-fold-mode "evil-vimish-fold" nil)

(autoload 'global-evil-vimish-fold-mode "evil-vimish-fold" "\
Toggle Evil-Vimish-Fold mode in all buffers.
With prefix ARG, enable Global Evil-Vimish-Fold mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Evil-Vimish-Fold mode is enabled in all buffers where
`turn-on-evil-vimish-fold-mode' would do it.
See `evil-vimish-fold-mode' for more information on Evil-Vimish-Fold mode.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-evil-vimish-fold-mode "evil-vimish-fold" nil nil nil)

(autoload 'turn-off-evil-vimish-fold-mode "evil-vimish-fold" "\
Turn off `evil-vimish-fold-mode'." t nil)

;;;### (autoloads "actual autoloads are elsewhere" "evil-vimish-fold"
;;;;;;  "../../../../.emacs.d/elpa/evil-vimish-fold-20200122.117/evil-vimish-fold.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/evil-vimish-fold-20200122.117/evil-vimish-fold.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "evil-vimish-fold" '("evil-vimish-fold-")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/evil-vimish-fold-20200122.117/evil-vimish-fold-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/evil-vimish-fold-20200122.117/evil-vimish-fold.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; evil-vimish-fold-autoloads.el ends here
