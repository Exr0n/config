;;; counsel-fd-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "counsel-fd" "counsel-fd.el" (0 0 0 0))
;;; Generated autoloads from counsel-fd.el

(autoload 'counsel-fd-dired-jump "counsel-fd" "\
Jump to a directory (in dired) below the current directory.
List all subdirectories within the current directory.
INITIAL-INPUT can be given as the initial minibuffer input.
INITIAL-DIRECTORY, if non-nil, is used as the root directory for search.

\(fn &optional INITIAL-INPUT INITIAL-DIRECTORY)" t nil)

(autoload 'counsel-fd-file-jump "counsel-fd" "\
Jump to a file below the current directory.
List all files within the current directory or any of its subdirectories.
INITIAL-INPUT can be given as the initial minibuffer input.
INITIAL-DIRECTORY, if non-nil, is used as the root directory for search.

\(fn &optional INITIAL-INPUT INITIAL-DIRECTORY)" t nil)

(register-definition-prefixes "counsel-fd" '("counsel-fd-command"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; counsel-fd-autoloads.el ends here
