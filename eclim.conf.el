(setq eclim-executable (executable-find "eclim"))
(setq eclimd-executable (executable-find "eclimd"))
(setq eclimd-default-workspace (expand-file-name "~/workspace"))

;; Displaying compilation error messages in the echo area
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

;; make debugging work
(defun toggle-maximize-buffer ()
 "Maximize buffer"
  (interactive)
  (if (= 1 (length (window-list)))
    (jump-to-register '_)
    (progn
      (set-register '_ (list (current-window-configuration)))
      (delete-other-windows))))

;; Yasnippet init if we have it
(defun my-eclim-yasnippet-setup ()
  (if (not (featurep 'yasnippet))
        (require 'yasnippet "yasnippet" t))
  (if (featurep 'yasnippet)
      (yas-global-mode 1)))

(add-hook 'global-eclim-mode-hook 'my-eclim-yasnippet-setup)

;; Configuring company-mode if present
(defun my-eclim-company-setup ()
    (if (not (featurep 'auto-complete))
        (progn
          (require 'company-emacs-eclim)
          (company-emacs-eclim-setup)
          (global-company-mode t))))

(add-hook 'global-eclim-mode-hook 'my-eclim-company-setup)

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
