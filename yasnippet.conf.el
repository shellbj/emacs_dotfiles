(put 'yas/snippet-dirs 'standard-value
     ;; as cus-edit.el specifies, "a cons-cell whose
     ;; car evaluates to the standard value"
     (list
      (list
       'quote
       (list (concat el-get-dir
                     (file-name-as-directory "yasnippet")
                     "snippets")
             (concat el-get-dir
                     (file-name-as-directory "yasnippet")
                     (file-name-as-directory "extras")
                     "imported")))))
