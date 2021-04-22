;;; shrink-whitespace-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "shrink-whitespace" "shrink-whitespace.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from shrink-whitespace.el

(autoload 'shrink-whitespace "shrink-whitespace" "\
Remove whitespace around cursor to just one or none.
If current line contains non-white space chars, then shrink any
whitespace char surrounding cursor to just one space.  If current
line does not contain non-white space chars, then remove blank
lines to just one.
Argument ARG Prevents removal of newlines when no other whitespace exists.

\(fn ARG)" t nil)

(autoload 'shrink-whitespace-grow-whitespace-around "shrink-whitespace" "\
Counterpart to 'shrink-whitespace', grow whitespace in a smartish way." t nil)

(autoload 'shrink-whitespace-shrink-whitespace-around "shrink-whitespace" "\
Shrink whitespace surrounding point." t nil)

(register-definition-prefixes "shrink-whitespace" '("grow-whitespace-around" "shrink-whitespace-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; shrink-whitespace-autoloads.el ends here
