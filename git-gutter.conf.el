(global-git-gutter-mode 1)

;; Diminish mode-line noise if available
(if (fboundp 'diminish)
    (diminish 'git-gutter-mode))
