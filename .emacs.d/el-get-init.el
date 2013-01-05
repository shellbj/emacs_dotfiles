;; Define where to look for init-pkgname.el configurations
(setq el-get-user-package-directory
      (expand-file-name (concat (file-name-as-directory user-emacs-directory) "recipes/config")))

;; use these recipes
(setq el-get-packages
      '(el-get

        magit

        groovy-emacs-mode

        yasnippet

        asciidoc
        markdown-mode
        rst-mode

        ruby-mode
        rspec-mode
        rvm

        puppet-mode

        python-mode
        pylookup
        python-pep8
        ropemacs
        rst-mode
        virtualenv

        yaml-mode

        haskell-mode
        haskell-mode-exts

        clojure-mode
        midje-mode
        elein
        nrepl

        scala-mode
))

(defun my-el-get-post-install-hook (pkg)
  ;; after installing el-get, load the local package list
  (if (string-equal pkg "el-get")
      (let ((my-packages (append el-get-packages
                                 (mapcar 'el-get-source-name el-get-sources))))
        (el-get-cleanup my-packages)
        (el-get 'sync my-packages))))
(add-hook 'el-get-post-install-hooks 'my-el-get-post-install-hook)

;; try to require el-get
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
       (lambda (s)
         (let (el-get-master-branch)
           (end-of-buffer)
           (eval-print-last-sexp))))))

;; Add locally curated recipes for el-get
(add-to-list 'el-get-recipe-path (file-name-directory el-get-user-package-directory))

;; successfully required el-get, load the packages!
(my-el-get-post-install-hook "el-get")
