;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "answers"
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
    '("cat" 1)
    "wts"
    "p"
    "M"
    "Ent"
    "id"
    "comp"
    "tensor"
    "lto"
    "mapsfrom"
    "coloneqq"))
 :latex)

