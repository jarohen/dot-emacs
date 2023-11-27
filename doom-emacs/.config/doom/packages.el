;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! evil-cleverparens)

(package! adoc-mode)

(unpin! (:lang clojure))

(package! clojure-mode :pin "525fc1b131b1fc537aa82d83d9eb2ea833cface6")
(package! clj-refactor :pin "b476345c580ae7cbc6b356ba0157db782684c47f")
(package! cider :pin "d16988719ae5561f32b06db0726adb03d84fe15c")
