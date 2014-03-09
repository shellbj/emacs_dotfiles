(global-undo-tree-mode)

;; Diminish mode-line noise if available
(if (fboundp 'diminish)
    (diminish 'undo-tree-mode))
