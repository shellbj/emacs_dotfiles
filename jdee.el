(add-to-list 'load-path (expand-file-name "packages/jde/lisp" user-emacs-directory))

(autoload 'jde-mode "jde" "JDE mode." t)
(autoload 'semantic-mode "semantic" "Semantic mode." t)

(setq auto-mode-alist (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))

(eval-after-load 'jde
  '(progn
     (require 'jde-maven)
     (set-default 'jde-complete-function 'jde-complete-minibuf)
     (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                       global-semanticdb-minor-mode
                                       global-semantic-idle-summary-mode
                                       global-semantic-mru-bookmark-mode))
     (semantic-mode 1)
     (set-default  'jde-jdk-registry (quote (("1.4" . "/opt/java/jdk1.4")
                                             ("1.5" . "/opt/java/jdk1.5")
                                             ("1.6" . "/opt/java/jdk1.6"))))
     (set-default 'jde-jdk (quote ("1.6")))
     (setq semantic-new-buffer-setup-functions (append '((jde-mode . wisent-java-default-setup)) semantic-new-buffer-setup-functions))))

(eval-after-load 'jde-javadoc
  '(progn
     (require 'working nil t)))

(eval-after-load 'jde-complete
  '(progn
     (set-default 'jde-complete-insert-method-signature nil)))

(eval-after-load 'jde-help
  '(progn
     (add-to-list 'jde-help-docsets '(nil "http://javadoc.jenkins-ci.org/" nil))
     (add-to-list 'jde-help-docsets '(nil "http://download.oracle.com/docs/cd/E17802_01/j2se/javase/technologies/desktop/javabeans/glasgow/javadocs/" nil)) ;; JavaMail
     (add-to-list 'jde-help-docsets '(nil "http://hadoop.apache.org/common/docs/r0.20.2/api/" nil)))) ;; Hadoop
