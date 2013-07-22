(deftheme my)

(let* ((class '((class color) (min-colors 89)))
       (fg-tty "white")
       (bg-tty "black")
       (fg "#fdfdfd")
       (fg-1 "#ededed")
       (fg-2 "#dddddd")
       (fg-3 "#cdcdcd")
       (fg-4 "#bdbdbd")
       (bg "#000000")
       (bg+1 "#101010")
       (bg+2 "#202020")
       (bg+3 "#303030")
       (bg+4 "#404040")
       (yellow "#b58900")
       (orange "#cb4b16")
       (red "#dc322f")
       (magenta "#d33682")
       (violet "#6c71c4")
       (blue "#268bd2")
       (cyan "#2aa198")
       (green "#859900"))
  (custom-theme-set-faces
   'my
   ;; basic coloring
   `(default ((((type tty)) (:foreground ,fg-tty :background ,bg-tty))
              (,class (:foreground ,fg :background ,bg))))
   ;; `(shadow ((,class ( ))))
   ;; `(match ((,class ())))
   `(cursor ((,class (:foreground ,bg :background ,cyan :inverse-video t))))
   `(escape-glyph-face ((,class (:foreground ,red))))
   ;; `(fringe ((,class ())))
   ;; `(header-line ((,class ())))
   `(link-visited ((,class (:underline t :foreground "dark cyan"))))
   `(success ((,class (:foreground ,green ))))
   `(warning ((,class (:foreground ,yellow ))))
   `(error ((,class (:foreground ,orange  :weight bold :underline t))))
   `(escape-glyph ((,class (:foreground ,violet))))

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
   `(font-lock-string-face ((,class (:foreground ,yellow))))
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
