;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "cheat_sheet"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("geometry" "a4paper" "margin=1in") ("amsmath" "") ("amssymb" "") ("amsthm" "") ("tikz-cd" "") ("mathrsfs" "")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "geometry"
    "amsmath"
    "amssymb"
    "amsthm"
    "tikz-cd"
    "mathrsfs")
   (TeX-add-symbols
    "comp"
    "id"))
 :latex)

