(eval-after-load 'tramp
  '(progn
     ;; Backups
     (setq tramp-backup-directory-alist backup-directory-alist)
     (setq backup-enable-predicate
	   (lambda (name)
	     (and (normal-backup-enable-predicate name)
		  (not
		   (let ((method (file-remote-p name 'method)))
		     (when (stringp method)
		       (member method '("su" "sudo"))))))))
     ;; Proxies
     (add-to-list 'tramp-default-proxies-alist
		  '("\\.orbitz\\.com\\'" "\\`orbitz\\'" "/ssh:%h:"))
     (add-to-list 'tramp-default-proxies-alist
		  '("\\.duncllc\\.com\\'" "\\`orbitz\\'" "/ssh:%h:"))))
