(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/confluence"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/python-extra"))

(load-file (expand-file-name "~/.emacs.d/jdee.el"))
(load-file (expand-file-name "~/.emacs.d/myvc.el"))
(load-file (expand-file-name "~/.emacs.d/mytramp.el"))

(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

(set-default 'indent-tabs-mode nil)

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
 c-basic-offset 4
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

(require 'my "my-theme")

(defun my-dired-load-hook ()
  (require 'dired-x))
(add-hook 'dired-load-hook 'my-dired-load-hook)

(defun my-dired-mode-hook ()
  (if (not (featurep 'dired-x)) (require 'dired-x))
  (dired-omit-mode 't)
  (define-key dired-mode-map "\C-k" 'dired-kill-subdir))
(add-hook 'dired-mode-hook 'my-dired-mode-hook)

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

;; confluence editing support
(autoload 'confluence-get-page "confluence" nil t)

;; open confluence page
(global-set-key "\C-xwf" 'confluence-get-page)

(eval-after-load "confluence"
  '(progn
     (require 'longlines)
     (progn
       (add-hook 'confluence-mode-hook 'longlines-mode)
       (add-hook 'confluence-before-save-hook 'longlines-before-revert-hook)
       (add-hook 'confluence-before-revert-hook 'longlines-before-revert-hook)
       (add-hook 'confluence-mode-hook '(lambda () (local-set-key "\C-j" 'confluence-newline-and-indent)))
       (setq confluence-default-space-alist (list (cons confluence-url "sas"))
             confluence-url "http://wiki.orbitz.net/rpc/xmlrpc"))))

;; setup confluence mode
(add-hook 'confluence-mode-hook
          '(lambda ()
             (local-set-key "\C-xw" confluence-prefix-map)))

;; robot-mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/robot-mode"))
(autoload 'robot-mode "robot-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.tsv\\'" . robot-mode))
