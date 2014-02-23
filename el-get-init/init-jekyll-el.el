(setq jekyll-directory (expand-file-name "blog/" "~"))
(setq jekyll-post-template "---\nlayout: post\ntitle: %s\ncategories: \ntags: \n---\n\n")
(jekyll-init-keybindings)
