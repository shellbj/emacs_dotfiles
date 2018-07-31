(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-tooltip-align-annotations 't)          ; align annotations to the right tooltip border
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows

(global-set-key (kbd "C-c /") 'company-files)        ; Force complete file names on "C-c /" key
