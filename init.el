;; Without this comment emacs25 adds (package-initialize) here
;; (package-initialize)

;;; Generate autoloads for configuration
(let ((generated-autoload-file (expand-file-name "autoloads.el" user-emacs-directory)))
  (update-directory-autoloads user-emacs-directory)
  (load generated-autoload-file)
  (let ((buf (get-file-buffer generated-autoload-file)))
    (when buf (kill-buffer buf))))

;;; Load configuration files after features are loaded
(dolist (file (directory-files user-emacs-directory))
  (when (string-match (format "^\\(.+\\)\\.conf\\.el$") file)
    (eval-after-load (match-string-no-properties 1 file)
      `(load ,(concat user-emacs-directory file)))))

;;; Don't mess with `user-init-file` when using Custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;;; el-get
(load-file (expand-file-name "el-get-init.el" user-emacs-directory))

;;; Themes
(setq custom-theme-directory (expand-file-name "themes" user-emacs-directory))
(load-theme 'my t)

;;; Machine specific settings
;; Local one off config settings
(let ((local-config (expand-file-name "local.el" user-emacs-directory)))
  (when (file-exists-p local-config)
    (load local-config)))

;; Local packages for loading
(defvar local-packages-dir (expand-file-name "packages" user-emacs-directory)
  "Location of any random elisp files I find from other authors.")
(add-to-list 'load-path local-packages-dir)

(dolist (project (directory-files local-packages-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;;; Packages that should always be loaded
(require 'ido)
(require 'undo-tree)
(require 'git-gutter)
(require 'windmove)                   ; move to other windows out of order
(require 'winner)                     ; window configuration undo/redo
(require 'paren)                      ; show match parentheses
(require 'hl-line)                    ; highlight the current line
(require 'ibuffer)

;;; User info
(setq user-full-name "Bryan Shell")
(setq user-mail-address "bryan.shell@orbitz.com")

;;; random settings
(setq
 c-basic-offset 4
 diff-switches "-u"
 ; contemplate crass confusion
 enable-recursive-minibuffers t)

(setq-default
 comment-column 0)

;;; GUI Settings
(setq
 ;; Do not show a splash screen.
 inhibit-splash-screen t
 ;; Do not show the startup message
 inhibit-startup-message t
 ;; Prevent mouse acrobatics
 mouse-yank-at-point t
 ;; Show incomplete chords while typing them.
 echo-keystrokes 0.1)

;; don't bother updating a menu I never see
(recentf-mode -1)

(setq-default
 ;; Show start and end of buffers on the right
 indicate-buffer-boundaries 'right
 ;; Show the end of files inside buffers.
 indicate-empty-lines t)

;; enable visual feedback on selections
(transient-mark-mode t)
;; delete selected text
(delete-selection-mode t)

;; font-lock everything
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; Revert buffers when underlying files change
(global-auto-revert-mode t)

;; add a new line to the end on saves
(setq require-final-newline t)

;; tab handling
(setq-default indent-tabs-mode nil
              tab-width 2)

;; re-enable commands
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

;; alias "yes" or "no" to "y" or "n"
(fset 'yes-or-no-p 'y-or-n-p)

;; Hide the scroll bar, tool bar, and menu bar.
(unless (eq (window-system) 'mac)
  (when (and (fboundp 'menu-bar-mode) (not (eq menu-bar-mode -1)))
    (menu-bar-mode -1)))
(when (and (fboundp 'scroll-bar-mode) (not (eq scroll-bar-mode -1)))
    (scroll-bar-mode -1))
(if (boundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1))
(when (and (fboundp 'tool-bar-mode) (not (eq tool-bar-mode -1)))
  (tool-bar-mode -1))

;; No Rudolf to light my way
(blink-cursor-mode -1)

;; X selections should stay in the kill ring
(setq save-interprogram-paste-before-kill t)
(setq x-select-enable-primary t)
(setq x-select-enable-clipboard t)

;;; Modeline info
;; Line and Column number in the modeline
(line-number-mode t)
(column-number-mode t)

 ;; show the clock in the proper format
(setq display-time-24hr-format t)
(display-time-mode t)

;;; Backups
(setq auto-save-file-name-transforms `(("\\(.*/\\)*\\([^/]*\\)"
                                        ,(expand-file-name "backups/\\2" user-emacs-directory) t)))
(add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))
(add-to-list 'backup-directory-alist (cons "." (expand-file-name "backups" user-emacs-directory)))

(setq
 ;; always make numbered backups
 version-control t
 ;; always copy for backups
 backup-by-copying t
 ;; handle backups for linked files properly
 backup-by-copying-when-linked t)

;;; Key Bindings
;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(when window-system
  (global-unset-key (kbd "C-z")))       ; suspend-frame causes wierdness

;; End
