;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! evil-cleverparens)
(package! adoc-mode)

(package! keycast)
(package! astro-ts-mode)

(package! copilot
  :recipe (:host github :repo "copilot-emacs/copilot.el" :files ("*.el")))

(package! ebnf-mode)

(package! smartparens
  :recipe (:host github :repo "Fuco1/smartparens" :fork "tomdl89/smartparens" :branch "fix-sp-region-ok-p-regex"))
