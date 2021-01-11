;;; smooth-scrolling-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "smooth-scrolling" "../../../../.emacs.d/elpa/smooth-scrolling-20161002.1949/smooth-scrolling.el"
;;;;;;  "324de3156a9273b423951e54d4652cc9")
;;; Generated autoloads from ../../../../.emacs.d/elpa/smooth-scrolling-20161002.1949/smooth-scrolling.el

(defvar smooth-scrolling-mode nil "\
Non-nil if Smooth-Scrolling mode is enabled.
See the `smooth-scrolling-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `smooth-scrolling-mode'.")

(custom-autoload 'smooth-scrolling-mode "smooth-scrolling" nil)

(autoload 'smooth-scrolling-mode "smooth-scrolling" "\
Make emacs scroll smoothly

If called interactively, enable Smooth-Scrolling mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(defvar smooth-scroll-margin 10 "\
Number of lines of visible margin at the top and bottom of a window.
If the point is within these margins, then scrolling will occur
smoothly for `previous-line' at the top of the window, and for
`next-line' at the bottom.

This is very similar in its goal to `scroll-margin'.  However, it
is implemented by activating `smooth-scroll-down' and
`smooth-scroll-up' advise via `defadvice' for `previous-line' and
`next-line' respectively.  As a result it avoids problems
afflicting `scroll-margin', such as a sudden jump and unexpected
highlighting of a region when the mouse is clicked in the margin.

Scrolling only occurs when the point is closer to the window
boundary it is heading for (top or bottom) than the middle of the
window.  This is to intelligently handle the case where the
margins cover the whole buffer (e.g. `smooth-scroll-margin' set
to 5 and `window-height' returning 10 or less).

See also `smooth-scroll-strict-margins'.")

(custom-autoload 'smooth-scroll-margin "smooth-scrolling" t)

(defvar smooth-scroll-strict-margins t "\
If true, the advice code supporting `smooth-scroll-margin'
will use `count-screen-lines' to determine the number of
*visible* lines between the point and the window top/bottom,
rather than `count-lines' which obtains the number of actual
newlines.  This is because there might be extra newlines hidden
by a mode such as folding-mode, outline-mode, org-mode etc., or
fewer due to very long lines being displayed wrapped when
`truncate-lines' is nil.

However, using `count-screen-lines' can supposedly cause
performance issues in buffers with extremely long lines.  Setting
`cache-long-line-scans' may be able to address this;
alternatively you can set this variable to nil so that the advice
code uses `count-lines', and put up with the fact that sometimes
the point will be allowed to stray into the margin.")

(custom-autoload 'smooth-scroll-strict-margins "smooth-scrolling" t)

(autoload 'enable-smooth-scroll-for-function "smooth-scrolling" "\
Define advice on FUNC to do smooth scrolling.

This adds after advice with name `smooth-scroll' to FUNC.

Note that the advice will not have an effect unless
`smooth-scrolling-mode' is enabled.

\(fn FUNC)" nil t)

;;;### (autoloads "actual autoloads are elsewhere" "smooth-scrolling"
;;;;;;  "../../../../.emacs.d/elpa/smooth-scrolling-20161002.1949/smooth-scrolling.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ../../../../.emacs.d/elpa/smooth-scrolling-20161002.1949/smooth-scrolling.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "smooth-scrolling" '("disable-smooth-scroll-for-function" "do-smooth-scroll" "enable-smooth-scroll-for-function-conditionally" "smooth-scroll-" "window-is-at-bob-p")))

;;;***

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/smooth-scrolling-20161002.1949/smooth-scrolling-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/smooth-scrolling-20161002.1949/smooth-scrolling.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; smooth-scrolling-autoloads.el ends here
