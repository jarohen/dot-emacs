(define-derived-mode bridje-mode prog-mode
  "Bridje")

(when (package-installed-p 'lsp-mode)
  (require 'lsp)

  (add-to-list 'lsp-language-id-configuration
               '(bridje-mode . "bridje"))

  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("java"
                                                            "-Dtruffle.class.path.append=/home/james/src/james/bridje/language/build/libs/brj-language.jar"
                                                            "-jar" "/home/james/src/james/bridje/launcher/build/libs/brj-launcher.jar" "--lsp"))
                    :major-modes '(bridje-mode)
                    :server-id 'bridje))

  (add-hook 'bridje-mode-hook 'lsp)

  (defun lsp-brj-eval-defun ()
    "Request server info raw data."
    (interactive)
    (lsp--cur-workspace-check)
    (lsp--flush-delayed-changes)
    (message "%s" (lsp--json-serialize
                   (lsp-request "brj/evalDefun"
                                (list :textDocument (lsp--versioned-text-document-identifier)
                                      :position (lsp--cur-position))))))

  (defun lsp-brj-eval-buffer ()
    "Request server info raw data."
    (interactive)
    (lsp--cur-workspace-check)
    (lsp--flush-delayed-changes)
    (message "%s" (lsp--json-serialize
                   (lsp-request "brj/evalBuffer"
                                (list :textDocument (lsp--versioned-text-document-identifier))))))

  (spacemacs/set-leader-keys-for-major-mode 'bridje-mode "eb" 'lsp-brj-eval-buffer)
  (spacemacs/set-leader-keys-for-major-mode 'bridje-mode "ef" 'lsp-brj-eval-defun))

(provide 'bridje-mode)
