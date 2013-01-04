;;; Directory Local Variables
;;; See Info node `(emacs) Directory Variables' for more information.

((nil
  (sentence-end-double-space . t)
  (require-final-newline . t))
 (emacs-lisp-mode
  (whitespace-style face trailing lines-tail)
  (whitespace-line-column . 80)
  (eval ignore-errors
        (add-hook 'before-save-hook 'delete-trailing-whitespace)
        (require 'whitespace)
        "Need to ensure that whitespace mode is turned off and on again. This guaranteees that the new values of the whitespace-related variables will take effect."
        (whitespace-mode 0)
        (whitespace-mode 1))))
