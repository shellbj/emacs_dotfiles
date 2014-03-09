(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(define-key (current-global-map) [remap execute-extended-command] 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
