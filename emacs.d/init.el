(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/colortheme"))

(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

(setq
 transient-mark-mode t ;; enable visual feedback on selections
 blink-cursor-mode nil
 column-number-mode t
 c-basic-offset 2
 mouse-yank-at-point t
 inhibit-startup-message t
 backup-by-copying-when-linked t
 auto-save-interval 600
 version-control t
 indicate-empty-lines t
 scroll-bar-mode nil
 show-paren-mode t
 tool-bar-mode nil
 indicate-buffer-boundaries (quote ((top . left) (bottom . right)))
 diff-switches "-u"
 display-time-24hr-format t
 add-log-always-start-new-record t
 mode-line-in-non-selected-windows nil  ; keep things quiet for now
 enable-recursive-minibuffers t         ; contemplate crass confusion
 confirm-kill-emacs 'y-or-n-p)

(add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))
(add-to-list 'backup-directory-alist (cons "." "~/.emacs.d/backups/"))

(require 'color-theme)
(eval-after-load "color-theme"
  (progn
    (color-theme-initialize)
    (color-theme-mine)))

(add-hook 'dired-load-hook
          (function (lambda ()
                      (load "dired-x")
                      )))
(add-hook 'dired-mode-hook 'my-dired-mode-hook)

(defun my-dired-mode-hook ()
  (if (< 22 emacs-major-version)
      (dired-omit-mode 't))
  (define-key dired-mode-map "\C-k" 'dired-kill-subdir)
  )

;; only delete the selection on a delete command
(require 'delsel)
(eval-after-load "delsel"
  (progn
    (put 'self-insert-command 'delete-selection nil)
    (put 'self-insert-iso 'delete-selection nil)
    (put 'yank 'delete-selection nil)
    (put 'clipboard-yank 'delete-selection nil)
    (put 'insert-register 'delete-selection nil)
    (put 'newline-and-indent 'delete-selection nil)
    (put 'newline 'delete-selection nil)
    (put 'open-line 'delete-selection nil)))