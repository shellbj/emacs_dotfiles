;;;###autoload
(progn
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode)))

(defun my-web-mode-hook ()
  "Hook for `web-mode'."
  (if (not (featurep 'company-mode))
      (require 'company-mode "company-mode" t))
  (if (not (featurep 'company-web-html))
      (require 'company-web "company backend for html web-mode" t))
  (if (not (featurep 'emmet-mode))
      (require 'emmet-mode "emmet-mode" t))
  (if (featurep 'yasnippet)
      (yas-global-mode 1))
  (set (make-local-variable 'company-backends)
       '(company-web-html company-yasnippet company-files)))

(add-hook 'web-mode-hook 'my-web-mode-hook)

;; (add-hook 'web-mode-hook (lambda ()
;;                           (set (make-local-variable 'company-backends) '(company-web-html))
;;                           (company-mode t)))

;; ;; Enable JavaScript completion between <script>...</script> etc.
;; (defadvice company-tern (before web-mode-set-up-ac-sources activate)
;;   "Set `tern-mode' based on current language before running company-tern."
;;   (message "advice")
;;   (if (equal major-mode 'web-mode)
;;       (let ((web-mode-cur-language
;;              (web-mode-language-at-pos)))
;;         (if (or (string= web-mode-cur-language "javascript")
;;                 (string= web-mode-cur-language "jsx")
;;                 )
;;             (unless tern-mode (tern-mode))
;;           (if tern-mode (tern-mode -1))))))

;; manual autocomplete
(define-key web-mode-map (kbd "M-SPC") 'company-complete)
