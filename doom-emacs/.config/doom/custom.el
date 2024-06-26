(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("ffafb0e9f63935183713b204c11d22225008559fa62133a69848835f4f4a758c" "7964b513f8a2bb14803e717e0ac0123f100fb92160dcf4a467f530868ebaae3e" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "51c71bb27bdab69b505d9bf71c99864051b37ac3de531d91fdad1598ad247138" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" default))
 '(git-commit-style-convention-checks '(non-empty-second-line))
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(org-agenda-files
   '("~/mnt/jms/journal.org" "~/mnt/jms/team-journal" "~/src/xtdb/xtdb-team" "~/src/xtdb/xtdb-leads"))
 '(package-selected-packages '(tree-sitter-langs astro-ts-mode elcord ebnf-mode))
 '(safe-local-variable-values
   '((cider-repl-display-help-banner)
     (cider-clojure-cli-aliases ":xtdb")
     (cider-clojure-cli-aliases . ":xtdb:dev")
     (cider-preferred-build-tool . gradle)
     (cider-clojure-cli-aliases . ":core2:dev")
     (eval add-to-list 'cider-test-defining-forms "def-slt-test")
     (eval define-clojure-indent
      (match 1)
      (for-all 1))
     (cider-ns-refresh-after-fn . "integrant.repl/resume")
     (cider-ns-refresh-before-fn . "integrant.repl/suspend"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ts-fold-replacement-face ((t (:foreground unspecified :box nil :inherit font-lock-comment-face :weight light)))))
