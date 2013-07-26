;; Define where to look for init-pkgname.el configurations
(setq el-get-user-package-directory
      (expand-file-name "recipes/config" user-emacs-directory))

;; use these recipes
(setq el-get-packages
      '(el-get
        magit
        gist
        yasnippet
        undo-tree
        diminish

        ;; ido addons
        ido-ubiquitous
        smex

        ;; css handling
        sass-mode
        scss-mode

        ;; emacs-lisp
        elisp-slime-nav

        ;; lisp
        autopair
        paredit
        rainbow-delimiters

        ;; puppet
        puppet-mode

        ;; documentation
        adoc-mode
        haml-mode
        markdown-mode
        mustache-mode
        rst-mode
        yaml-mode

        ;; groovy
        Emacs-Groovy-Mode

        ;; ruby
        ruby-mode
        rspec-mode
        rvm

        ;; python
        python-mode
        pylookup
        python-pep8
        ropemacs
        virtualenv
        jinja2-mode

        ;; haskell
        haskell-mode
        haskell-mode-exts

        ;; clojure
        clojure-mode
        cljsbuild-mode
        midje-mode
        elein
        nrepl
        ac-nrepl

        ;; scala
        scala-mode
))

;; try to require el-get
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch
          el-get-install-skip-emacswiki-recipes)
      (goto-char (point-max))
      (eval-print-last-sexp))))

;; successfully required el-get, load the packages!
(let ((my-packages (append el-get-packages
                           (mapcar 'el-get-source-name el-get-sources))))
	;; Add locally curated recipes for el-get
	(add-to-list 'el-get-recipe-path (file-name-directory el-get-user-package-directory))

  (el-get-cleanup my-packages)
  (el-get 'sync my-packages))
