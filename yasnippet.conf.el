(put 'yas/snippet-dirs 'standard-value
     ;; as cus-edit.el specifies, "a cons-cell whose
     ;; car evaluates to the standard value"
     (list
      (list
       'quote
       (list (concat (file-name-as-directory el-get-dir)
                     (file-name-as-directory "yasnippet")
                     "snippets")
             (concat (file-name-as-directory el-get-dir)
                     (file-name-as-directory "yasnippet")
                     (file-name-as-directory "extras")
                     "imported")
             (concat (file-name-as-directory user-emacs-directory)
                     "snippets")))))

(yas-global-mode 1)

(add-to-list 'auto-mode-alist '("snippets" . snippet-mode))
