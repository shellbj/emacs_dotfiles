(global-set-key (kbd "C-x C-z") 'magit-status)

;; Enable spell checking, fill for log editing
(add-hook 'magit-log-edit-mode-hook
          (lambda()
            (auto-fill-mode 1)
            (flyspell-mode 1)))
