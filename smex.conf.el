;;;###autoload
(define-key (current-global-map) [remap execute-extended-command] 'smex)
;;;###autoload
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
