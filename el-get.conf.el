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
(setq el-get-sources
      '(;; (:name eclim
        ;;        :type github
        ;;        :pkgname "shellbj/emacs-eclim")
        ))

;; Use these recipes
(el-get nil
        '(eclim
          auto-complete

        magit
        git-gutter
        ;; gist
        yasnippet
        undo-tree
        diminish
        ibuffer-vc
        fill-column-indicator

        company-mode

        gnuplot-mode

        dockerfile-mode

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
        racket-mode

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
        groovy-emacs-mode

        ;; ruby
        ;;         rspec-mode
        rbenv
        rubocop

        ;; python
        ;; python-mode                     ; python.org mode
        pyenv
        ;;         pylookup
        ;;         python-pep8
        ;;         ropemacs
        ;;         virtualenv
        ;;         jinja2-mode
        jedi

        ;; haskell
        haskell-mode
        ;;         haskell-mode-exts

        ;; clojure
        clojure-mode
        cider
        elein
        ;;         cljsbuild-mode
        ;;         midje-mode
        ;;         ;;nrepl
        ;;         ;;ac-nrepl

        ;; scala
        ;;         scala-mode
        ))
