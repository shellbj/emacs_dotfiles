;; el-get bootstrap

;; use the latest el-get
(setq el-get-master-branch t)

;; use ssh protocal for install url
(setq el-get-git-install-url
      "https://github.com/dimitri/el-get.git")

;; try to require el-get
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch
          el-get-install-skip-emacswiki-recipes)
      (goto-char (point-max))
      (eval-print-last-sexp))))
