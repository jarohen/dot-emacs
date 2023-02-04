;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "James Henderson"
      user-mail-address "james@jarohen.dev")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

(setq doom-theme 'doom-tomorrow-night)

(setq display-line-numbers-type t)

(setq evil-snipe-override-evil-repeat-keys nil)
(setq doom-localleader-key ",")

(setq which-key-show-early-on-C-h t)
(setq which-key-idle-delay 0.5)

(setq evil-escape-key-sequence "fd")
(setq evil-move-beyond-eol t)
(setq evil-kill-on-visual-paste nil)

(use-package evil-cleverparens
  :hook (prog-mode . evil-cleverparens-mode))

(use-package evil-smartparens
  :hook (prog-mode . evil-smartparens-mode))

(use-package smartparens
  :hook (prog-mode . smartparens-strict-mode))

(use-package lsp
  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-sideline-enable nil)
  (lsp-lens-enable nil)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-enable-indentation nil))

(use-package clojure-mode
  :config
  (map! (:localleader
         (:map (clojure-mode-map clojurescript-mode-map clojurec-mode-map)
               "ef" #'cider-eval-defun-at-point))))
