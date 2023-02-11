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

(setq doom-font
      (font-spec :family "Source Code Pro"
                 :size (cond
                          ((string= (system-name) "graphite") 16)
                          (t 13))))

(setq doom-big-font
      (font-spec :family "Source Code Pro"
                 :size (cond
                          ((string= (system-name) "graphite") 24)
                          (t 20))))

(setq doom-theme 'doom-tomorrow-night)

(setq display-line-numbers-type t)

(setq evil-snipe-override-evil-repeat-keys nil)
(setq doom-localleader-key ",")

(setq which-key-show-early-on-C-h t)
(setq which-key-idle-delay 0.5)

(setq evil-escape-key-sequence "fd")
(setq evil-move-beyond-eol t)
(setq evil-kill-on-visual-paste nil)

(global-subword-mode t)

(use-package evil-cleverparens
  :hook (prog-mode . evil-cleverparens-mode))

(use-package smartparens
  :hook (prog-mode . smartparens-strict-mode))

(use-package lsp
  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-sideline-enable nil)
  (lsp-lens-enable nil)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-enable-indentation nil))

(use-package company
  :custom
  (company-idle-delay nil)
  :config
  (map! (:map prog-mode-map
              "<tab>" #'company-indent-or-complete-common)))

(use-package clojure-mode
  :custom
  (cljr-insert-newline-after-require nil)
  (clojure-toplevel-inside-comment-form t)

  :config
  (map! (:localleader
         (:map (clojure-mode-map clojurescript-mode-map clojurec-mode-map)
               "ef" #'cider-eval-defun-at-point
               "pf" #'cider-pprint-eval-defun-at-point
               "tb" #'cider-test-show-report
               "rth" #'clojure-thread
               "ruw" #'clojure-unwind
               "rua" #'clojure-unwind-all)))
  (map! :map (clojure-mode-map clojurescript-mode-map clojurec-mode-map)
        :i
        "<backspace>" #'sp-backward-delete-char))

(map! (:localleader
       (:map emacs-lisp-mode-map
             "ef" #'eval-defun)))

(use-package magit
  :custom
  (magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))
  (magit-repository-directories '(("/home/james/src" . 2)))
  (git-commit-summary-max-length 7200)
  (git-commit-setup-hook '(git-commit-save-message git-commit-setup-changelog-support git-commit-propertize-diff with-editor-usage-message))
  (git-commit-fill-column 7200)
  (magit-diff-section-arguments '("--no-ext-diff")))

(use-package ace-window
  :config
  (map! :leader
        "ww" #'ace-window))
