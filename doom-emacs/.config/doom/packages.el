;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! evil-cleverparens)

(package! adoc-mode)

;; pin, remove after emacs 29 release
(package! transient
      :pin "c2bdf7e12c530eb85476d3aef317eb2941ab9440"
      :recipe (:host github :repo "magit/transient"))

;; pin, remove after emacs 29 release
(package! with-editor
          :pin "bbc60f68ac190f02da8a100b6fb67cf1c27c53ab"
          :recipe (:host github :repo "magit/with-editor")) 
