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

        (:name pyenv-mode
               :type github
               :pkgname "proofit404/pyenv-mode"
               :depends (pythonic))
        (:name pyenv-mode-auto
               :type github
               :pkgname "ssbb/pyenv-mode-auto"
               :depends (pyenv-mode s f))
        (:name jdecomp
               :type github
               :pkgname "xiongtx/jdecomp")
        ))

(el-get 'sync '(package))
(el-get-bundle elpa:company)
(el-get-bundle elpa:haskell-mode)

;(el-get-bundle elpa:scala-mode)
;(el-get-bundle elpa:sbt-mode)
;(el-get-bundle elpa:ensime)

;; Use these recipes
(el-get nil
        '(eclim
          editorconfig

          auto-complete

          exec-path-from-shell ; fix OS-X stupid shit

        magit
        magithub

        git-gutter
        ;; gist
        yasnippet
        yasnippet-snippets
        undo-tree
        diminish
        ibuffer-vc
        fill-column-indicator

        ;company

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
        pyenv-mode
        pyenv-mode-auto
        ;;         pylookup
        ;;         python-pep8
        ;;         ropemacs
        ;;         virtualenv
        ;;         jinja2-mode
        ;; jedi
        anaconda-mode
        company-anaconda

        ;; haskell
        ;haskell-mode
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
        ;scala-mode
;        ensime

        ;; go
        go-mode
        go-company

        ;; elixir
        elixir

        ;; web-mode
        web-mode
        company-web
        emmet-mode

        use-package

        ;; typescript
        tide
        ))

;; (package-initialize)
;; (when (not package-archive-contents)
;;   (package-refresh-contents)
;;   (package-install 'use-package))
;; (require 'use-package)
;; (use-package ensime
;;   :ensure t
;;   :pin melpa-stable)
