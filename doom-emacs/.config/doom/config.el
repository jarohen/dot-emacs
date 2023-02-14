;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "James Henderson"
      user-mail-address "james@jarohen.dev")

(setq doom-font
      (font-spec :family "Source Code Pro"
                 :size (cond
                          ((string= (system-name) "graphite") 16)
                          (t 13))))

(setq doom-theme 'doom-tomorrow-night)

(setq display-line-numbers-type t)
(global-subword-mode t)

;;;; Packages

(use-package doom-modeline
  :custom
  (doom-modeline-major-mode-icon t))

(use-package evil
  :custom
  (doom-localleader-key ",")
  (evil-escape-key-sequence "fd")
  (evil-move-beyond-eol t)
  (evil-kill-on-visual-paste nil)

  :config
  (map! :leader
         "TAB" nil
         :desc "Last Buffer" "TAB" #'evil-switch-to-windows-last-buffer)
  (map! :map evil-normal-state-map
        "/" #'+default/search-buffer))

(use-package evil-snipe
  :custom
  (evil-snipe-override-evil-repeat-keys nil))

(use-package which-key
  :custom
  (which-key-show-early-on-C-h t)
  (which-key-idle-delay 0.5))

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

(use-package projectile
  :custom
  (projectile-project-search-path '(("~/src" . 2) ("~/.config" . 1))))

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

(use-package elisp-mode
  :config
  (map! (:localleader
         (:map emacs-lisp-mode-map
               "ef" #'eval-defun))))

(use-package magit
  :custom
  (magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))
  (magit-repository-directories '(("/home/james/src" . 2)))
  (git-commit-summary-max-length 7200)
  (git-commit-setup-hook '(git-commit-save-message git-commit-setup-changelog-support git-commit-propertize-diff with-editor-usage-message))
  (git-commit-fill-column 7200)
  (magit-diff-section-arguments '("--no-ext-diff"))

  :config
  (map! :leader
      (:prefix "g"
        :desc "" "s" nil  ; remove existing binding
        :desc "Magit Status" "s" #'magit-status)))

(use-package ace-window
  :config
  (ace-window-display-mode t)
  (map! :leader
        "ww" #'ace-window))
