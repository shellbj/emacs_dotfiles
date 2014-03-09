(setq dired-x-hands-off-my-keys nil)
(require 'dired-x)

(define-key dired-mode-map (kbd "C-k") 'dired-kill-subdir)

(defun user/dired-mode-hook ()
  (dired-omit-mode 't))
(add-hook 'dired-mode-hook 'user/dired-mode-hook)

(put 'dired-find-alternate-file 'disabled nil)

(setq dired-listing-switches "-alh")
