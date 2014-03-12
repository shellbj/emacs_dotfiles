;; el-get configuration

;; Defer evaluation of :post-init and :after until libraries are required
(setq el-get-is-lazy t)

;; Be verbose about package setup
;(setq el-get-verbose t)

;; Use the latest el-get
(setq el-get-master-branch t)

;; Use ssh protocal for all github recipes
(setq el-get-github-default-url-type 'https)

;; Add locally curated recipes for el-get
(add-to-list 'el-get-recipe-path
             (expand-file-name "recipes" user-emacs-directory))

;; Locally curated defined inline
(setq el-get-sources nil)

;; Use these recipes
(el-get nil
        '(
        magit
        git-gutter
        ;; gist
        yasnippet
        undo-tree
        ;; diminish

        fill-column-indicator

        company-mode

        ;; ido addons
        ;; ido-ubiquitous
        smex

        ;; css handling
        sass-mode
        scss-mode

        ;; emacs-lisp
        ;;         elisp-slime-nav

        ;; lisp
        ;;         autopair
        ;;         paredit
        ;;         rainbow-delimiters

        ;; puppet
        ;; ;        puppet-mode

        ;; documentation
        ;; ;        adoc-mode
        ;; ;        haml-mode
        markdown-mode
        ;; ;        mustache-mode
        rst-mode
        yaml-mode
        textile-mode
        jekyll-el

        ;; groovy
        Emacs-Groovy-Mode

        ;; ruby
        ruby-mode
        ;;         rspec-mode
        ;;         rvm

        ;; python
        python-mode
        ;;         pylookup
        ;;         python-pep8
        ;;         ropemacs
        ;;         virtualenv
        ;;         jinja2-mode

        ;; haskell
        haskell-mode
        ;;         haskell-mode-exts

        ;; clojure
        ;;         clojure-mode
        ;;         cljsbuild-mode
        ;;         midje-mode
        ;;         elein
        ;;         ;;nrepl
        ;;         ;;ac-nrepl

        ;; scala
        ;;         scala-mode
        ))
