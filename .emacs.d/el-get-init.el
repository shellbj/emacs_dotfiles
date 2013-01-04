;; local sources
(setq el-get-sources
      '((:name magit
               :after (progn
                        (global-set-key (kbd "C-x C-z") 'magit-status)
                        ;; Enable spell checking, fill for log editing
                        (add-hook 'magit-log-edit-mode-hook
                                  (lambda()
                                    (auto-fill-mode 1)
                                    (flyspell-mode 1)))))
        (:name groovy-emacs-mode
               :type bzr
               :url "http://bazaar.launchpad.net/~bshell/groovy-emacs-mode/autoloads/"
               )
        (:name python-mode
               :type bzr
               :url "http://bazaar.launchpad.net/~a-roehler/python-mode/components-python-mode/")
        (:name yasnippet
               :after (progn
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
                                       "imported")))))))
))

;; use the standard recipes
(setq el-get-packages
      '(el-get

        asciidoc
        markdown-mode
        rst-mode

        ruby-mode
        rspec-mode
;        inf-ruby
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
;        ensime

;;        groovy-mode
;;        direx
))

(defun my-el-get-post-install-hook (pkg)
  ;; after installing el-get, load the local package list
  (if (string-equal pkg "el-get")
      (el-get 'sync
              (append el-get-packages
                      (mapcar 'el-get-source-name el-get-sources)))))
(add-hook 'el-get-post-install-hooks 'my-el-get-post-install-hook)

;; try to require el-get
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
       (lambda (s)
         (let (el-get-master-branch)
           (end-of-buffer)
           (eval-print-last-sexp))))))

;; successfully required el-get, load the packages!
(my-el-get-post-install-hook "el-get")
