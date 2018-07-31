(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
		    ("tromey" . "http://tromey.com/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

;; (eval-after-load 'el-get
;;   '(progn
;;      (package-initialize)
;;      (when (not package-archive-contents)
;;        (package-refresh-contents)
;;        (package-install 'use-package))
;;      (require 'use-package)
;;      (use-package ensime
;;      :ensure t
;;      :pin melpa-stable)))
