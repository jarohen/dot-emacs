;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "James Henderson"
      user-mail-address "james@jarohen.dev")

(setq doom-font
      (font-spec :family "Source Code Pro"
                 :size 16))

(setq doom-theme (if (string-match "dark" (string-trim (shell-command-to-string "darkman get")))
                     'doom-one
                   'doom-one-light))

(setq display-line-numbers-type t)
(global-subword-mode t)

(map! :map y-or-n-p-map "SPC" #'y-or-n-p-insert-y)

;;;; Packages

(use-package! doom-modeline
  :defer t
  :custom
  (doom-modeline-major-mode-icon t))

(use-package! evil
  :custom
  (evil-escape-key-sequence "fd")
  (evil-move-beyond-eol t)
  (evil-kill-on-visual-paste nil)

  :config
  (map! :leader
        "TAB" nil
        :desc "Last Buffer" "TAB" #'evil-switch-to-windows-last-buffer))

(use-package! evil-snipe
  :custom
  (evil-snipe-override-evil-repeat-keys nil))

(use-package! which-key
  :custom
  (which-key-show-early-on-C-h t)
  (which-key-idle-delay 0.5))

(use-package! evil-cleverparens
  :custom
  (evil-cleverparens-use-regular-insert t)

  :hook (prog-mode . evil-cleverparens-mode)
  :config
  (require 'evil-cleverparens-text-objects)
  (map! :map evil-cleverparens-mode-map
        :n "M-r" nil
        :n "M-j" nil
        :n "M-J" nil
        :n "M-s" nil
        :n "M-[" #'evil-cp-wrap-next-square))

(use-package! smartparens
  :hook (prog-mode . smartparens-strict-mode)

  :config
  (map! :leader
        :map smartparens-mode-map
        (:prefix ("k" . "lisp")
         "a" #'sp-absorb-sexp
         "b" #'sp-wrap-round
         "B" #'sp-wrap-curly
         "c" #'sp-convolute-sexp
         "e" #'sp-splice-sexp-killing-forward
         "E" #'sp-splice-sexp-killing-backward
         "j" #'sp-join-sexp
         "r" #'sp-raise-sexp
         "s" #'sp-split-sexp
         "t" #'sp-transpose-hybrid-sexp)))

(use-package! lsp
  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-sideline-enable nil)
  (lsp-lens-enable nil)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-enable-indentation nil))

(use-package! company
  :custom
  (company-idle-delay nil)
  :config
  (map! (:map prog-mode-map
              "<tab>" #'company-indent-or-complete-common)))

(use-package! project
  :config
  (map! (:leader
         "p%" #'project-query-replace-regexp)))

(use-package! projectile
  :custom
  (projectile-project-search-path '(("~/src" . 2) ("~/.config" . 1))))

(use-package! clojure-mode
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

(use-package! cider
  :custom
  (cider-test-fail-fast nil))

(use-package! elisp-mode
  :config
  (map! (:localleader
         (:map emacs-lisp-mode-map
               "ef" #'eval-defun))))

(use-package! magit
  :custom
  (magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))
  (magit-repository-directories '(("/home/james/src" . 2)))
  (git-commit-summary-max-length 7200)
  (git-commit-setup-hook '(git-commit-save-message git-commit-setup-changelog-support git-commit-propertize-diff with-editor-usage-message))
  (git-commit-fill-column 7200)
  (git-commit-style-convention-checks '(non-empty-second-line))
  (magit-diff-section-arguments '("--no-ext-diff"))

  :config
  (map! :leader
        (:prefix "g"
         :desc "" "s" nil  ; remove existing binding
         :desc "Magit Status" "s" #'magit-status)))

(use-package! web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.astro\\'" . web-mode)))

(use-package! ace-window
  :config
  (ace-window-display-mode t)
  (map! :leader
        "ww" #'ace-window))

(use-package! avy
  :config
  (map! :leader
        (:prefix ("j" . "jump")
         :desc "Jump to characters" "j" #'evil-avy-goto-char-timer
         :desc "Jump to line" "l" #'evil-avy-goto-line
         :desc "Jump to word" "w" #'evil-avy-goto-subword-1
         :desc "Jump to WORD" "W" #'evil-avy-goto-word-1)))

(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word))

  :config
  (add-to-list 'copilot-indentation-alist '(prog-mode . 2))
  (add-to-list 'copilot-indentation-alist '(org-mode . 2))
  (add-to-list 'copilot-indentation-alist '(text-mode . 2))
  (add-to-list 'copilot-indentation-alist '(clojure-mode . 2))
  (add-to-list 'copilot-indentation-alist '(emacs-lisp-mode . 2)))

(use-package! sql
  :custom
  (sql-connection-alist '((local-xtdb (sql-product 'postgres)
                           (sql-port 5432)
                           (sql-server "localhost")
                           (sql-user "xtdb")
                           (sql-password "xtdb")
                           (sql-database "xtdb"))
                          (local-xtdb-5433 (sql-product 'postgres)
                           (sql-port 5433)
                           (sql-server "localhost")
                           (sql-user "xtdb")
                           (sql-password "xtdb")
                           (sql-database "xtdb")))))
