(setq eclim-executable (executable-find "eclim"))
(setq eclimd-executable (executable-find "eclimd"))
(setq eclimd-default-workspace (expand-file-name "~/workspace"))

;; Displaying compilation error messages in the echo area
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

;; Configuring company-mode if present
(eval-after-load 'company
  '(if (not (featurep 'auto-complete))
       (progn
         (require 'company-emacs-eclim)
         (company-emacs-eclim-setup)
         (global-company-mode t))))

;; Configuring auto-complete-mode as a fall back
(eval-after-load 'auto-complete
  '(if (not (featurep 'company))
       (progn
         ;; regular auto-complete initialization
         (require 'auto-complete-config)
         (ac-config-default)
         ;; add the emacs-eclim source
         (require 'ac-emacs-eclim-source)
         (ac-emacs-eclim-config))))
