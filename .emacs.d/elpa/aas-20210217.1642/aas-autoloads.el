;;; aas-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "aas" "aas.el" (0 0 0 0))
;;; Generated autoloads from aas.el

(autoload 'aas-activate-keymap "aas" "\
Add KEYMAP-SYMBOL to the list of active snippet keymaps.

Return non-nil if that keymap actually exists and was added.
Otherwise return nil.

\(fn KEYMAP-SYMBOL)" nil nil)

(autoload 'aas-mode "aas" "\
Minor mode for dynamically auto-expanding snippets.

If called interactively, toggle `Aas mode'.  If the prefix
argument is positive, enable the mode, and if it is zero or
negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

The mode's hook is called both when the mode is enabled and when
it is disabled.

This does not set any default keymaps. For that use
`ass-activate-for-major-mode' and `aas-activate-keymap'.

\(fn &optional ARG)" t nil)

(autoload 'ass-activate-for-major-mode "aas" nil nil nil)

(register-definition-prefixes "aas" '("aas-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; aas-autoloads.el ends here
