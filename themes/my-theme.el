(deftheme my)

(let* ((class '((class color) (min-colors 89)))
       (fg-tty "white")
       (bg-tty "black")
       (fg "#fdfdfd")
       (fg-1 "#e6e6e6")
       (fg-2 "#cccccc")
       (fg-3 "#b3b3b3")
       (fg-4 "#999999")
       (bg "#000000")
       (bg+1 "#1a1a1a")
       (bg+2 "#333333")
       (bg+3 "#4d4d4d")
       (bg+4 "#666666")
       (bg+5 "#808080")
       (yellow "#b58900")
       (orange "#cb4b16")
       (red "#dc322f")
       (magenta "#d33682")
       (violet "#6c71c4")
       (blue "#268bd2")
       (cyan "#2aa198")
       (green "#859900")
       ;; lighter accents
       (yellow+1 "#dbd000")
       (orange+1 "#")
       (red+1 "#")
       (magenta+1 "#")
       (violet+1 "#")
       (blue+1 "#")
       (cyan+1 "#34cbbe")
       (green+1 "#")
       ;; darker accents
       (yellow-1 "#dbd000")
       (orange-1 "#")
       (red-1 "#")
       (magenta-1 "#")
       (violet-1 "#")
       (blue-1 "#")
       (cyan-1 "#1f7a72")
       (green-1 "#")
       )
  (custom-theme-set-faces
   'my
   ;; basic coloring
   `(default ((((type tty)) (:foreground ,fg-tty :background ,bg-tty))
              (,class (:foreground ,fg :background ,bg))))
   ;; `(shadow ((,class ( ))))
   ;; `(match ((,class ())))
   `(cursor ((,class (:foreground ,bg :background ,cyan :inverse-video t))))
   `(error ((,class (:foreground ,orange  :weight bold :underline t))))
   `(escape-glyph ((,class (:foreground ,violet))))
   `(escape-glyph-face ((,class (:foreground ,red))))
   ;; `(fringe ((,class ())))
   ;; `(header-line ((,class ())))
   `(highlight ((,class (:background ,bg+1 ))))
   `(link-visited ((,class (:underline t :foreground ,cyan-1))))
   `(success ((,class (:foreground ,green ))))
   `(warning ((,class (:foreground ,yellow ))))

   ;; misc faces
   `(region ((,class (:background "darkslateblue" :foreground ,fg))))
   `(button ((,class (:underline t :foreground ,cyan))))

   ;; font lock
   `(font-lock-builtin-face ((,class (:foreground ,orange))))
   `(font-lock-comment-face ((,class (:foreground ,red))))
   `(font-lock-constant-face ((,class (:foreground ,green))))
   `(font-lock-doc-face ((,class (:foreground ,cyan :slant italic))))
   `(font-lock-doc-string-face ((,class (:foreground ,blue))))
   `(font-lock-function-name-face ((,class (:foreground ,blue))))
   `(font-lock-keyword-face ((,class (:foreground ,cyan))))
   `(font-lock-negation-char-face ((,class (:foreground ,fg))))
   `(font-lock-preprocessor-face ((,class (:foreground ,blue))))
   `(font-lock-string-face ((,class (:foreground ,yellow+1))))
   `(font-lock-type-face ((,class (:foreground "Coral"))))
   `(font-lock-variable-name-face ((,class (:bold t :foreground ,fg))))
   `(font-lock-warning-face ((,class (:bold t :foreground ,red))))

   ;; isearch
   `(isearch ((,class (:foreground ,fg :background ,yellow :bold t))))
   `(isearch-fail ((,class (:background ,red))))
   `(lazy-highlight ((,class (:background ,violet))))

   ;; diff
   `(diff-header ((,class (:foreground ,blue :weight bold))))
   `(diff-file-header ((,class (:foreground ,cyan :weight bold))))
   `(diff-index ((,class (:inherit diff-file-header))))
   `(diff-hunk-header ((,class (:inherit diff-header))))
   `(diff-removed ((,class (:foreground ,red))))
   `(diff-added ((,class (:foreground ,green))))
   `(diff-changed ((,class (:foreground ,yellow))))
   `(diff-indicator-removed ((,class (:inherit diff-removed))))
   `(diff-indicator-added ((,class (:inherit diff-added))))
   `(diff-indicator-changed ((,class (:inherit diff-changed))))
   `(diff-function ((,class (:inherit diff-header))))
   `(diff-context ((,class (:inherit shadow))))
   `(diff-nonexistent ((,class (:inherit diff-file-header))))
   `(diff-refine-change ((,class (:foreground ,fg :background ,yellow))))
   `(diff-refine-remove ((,class (:foreground ,fg :background ,red))))
   `(diff-refine-added ((,class (:foreground ,fg :background ,green))))

   ;; ediff
   `(ediff-current-diff-A ((,class (:background "green4" :foreground "white"))))
   `(ediff-current-diff-B ((,class (:background "darkorange3" :foreground "white"))))

   ;; magit
   `(magit-item-highlight ((,class (:inherit nil))))

   ;; dired
   `(dired-header ((,class (:inherit font-lock-type-face))))
   `(dired-mark ((,class (:inherit font-lock-constant-face))))
   `(dired-marked ((,class (:inherit warning))))
   `(dired-flagged ((,class (:inherit error))))
   `(dired-warning ((,class (:inherit font-lock-warning-face)))) ;; font-lock-comment-face
   `(dired-perm-write ((,class (:inherit font-lock-comment-delimiter-face)))) ;; font-lock-comment-face
   `(dired-directory ((,class (:inherit font-lock-function-name-face))))
   `(dired-symlink ((,class (:inherit font-lock-keyword-face))))
   `(dired-ignored ((,class (:inherit shadow))))
   ))

(provide-theme 'my)

;; Local Variables:
;; no-byte-compile: t
;; End:
