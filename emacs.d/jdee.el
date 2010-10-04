(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/jde/lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/jdee-extra"))

(autoload 'jde-mode "jde" "JDE mode." t)

;(semantic-mode)

(setq auto-mode-alist (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))

(set-default  'jde-jdk-registry (quote (("1.4" . "/usr/local/java/jdk1.4")
					("1.5" . "/usr/local/java/jdk1.5")
					("1.6" . "/usr/local/java/jdk1.6")
					("1.3" . "/usr/local/java/jdk1.3"))))
(set-default 'jde-jdk (quote ("1.6")))

;(setq semantic-new-buffer-setup-functions (append '((jde-mode . wisent-java-default-setup)) semantic-new-buffer-setup-functions))


