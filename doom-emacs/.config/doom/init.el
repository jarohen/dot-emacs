;;; init.el -*- lexical-binding: t; -*-

;; see https://github.com/doomemacs/doomemacs/issues/7130
(setq doom-localleader-key ",")

(doom! :input

       :completion
       company
       vertico

       :ui
       doom
       doom-dashboard
       (emoji +unicode)
       hl-todo
       modeline
       ophints
       (popup +defaults)
       unicode
       (vc-gutter +pretty)
       vi-tilde-fringe

       :editor
       (evil +everywhere)
       file-templates
       fold
       format
       snippets

       :emacs
       dired
       electric
       undo
       vc

       :term
       eshell

       :checkers
       syntax
       (spell +flyspell)

       :tools
       docker
       (eval +overlay)
       gist
       lookup
       lsp
       (magit +forge)
       make
       pass
       pdf
       tree-sitter

       :os
       tty

       :lang
       (clojure +lsp)
       emacs-lisp
       (graphql +lsp)
       (haskell +lsp)
       json
       (java +lsp)
       javascript
       kotlin
       markdown
       org
       rest
       (rust +lsp)
       sh
       web
       yaml

       :config
       (default +bindings))
