(setq user-full-name "Moritz Schwerer"
      user-mail-address "moritz.schwerer@gmx.de")

;; base is doom-one
(setq doom-theme 'doom-one)
(set-face-attribute 'default nil :height 150)

(setq org-directory "~/Documents/org")

(setq display-line-numbers-type `relative)

(setq auto-save-default t
      make-backup-files t)
(setq confirm-kill-emacs nil)
;;(toggle-frame-fullscreen)

(telephone-line-mode 1)

(defun efs/set-font-faces ()
  (message "Setting faces!")
  (set-face-attribute 'default nil :font "JetBrains Mono" :height 140)

;; Set the fixed pitch face
  (set-face-attribute 'fixed-pitch nil :font "JetBrains Mono" :height 140)

;; Set the variable pitch face
  (set-face-attribute 'variable-pitch nil :font "JetBrains Mono" :height 140 :weight 'regular))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (efs/set-font-faces))))
  (efs/set-font-faces))

(defconst jetbrains-ligature-mode--ligatures
    '(
       "-->" "/**" "/*" "*/" "<!--" ":=" "->>" "<<-" "->" "<-"
       "<=>" "===" "!==" "<=" ">=" "=:=" "!=" "&&" "||"
      "|||" "///" "&&&" "==" "+++" "--" "==>" "|>" "<|" "||>" "<||"
      "|||>" "<|||" ">>>" "<<<" "::=" "|]" "[|" "{|" "|}"
      "[<" ">]" ":?>" ":?" "/=" "[||]" "!!" "?:" "?." ":::"
      "++" "?" "####" "###" "::" ".?" "?=" "=!=" "<|>"
      "<:" ":<" ":>" ">:" "<>" ";;" "/==" ".=" ".-" "__"
      "=/=" "<-<" "<<" ">>" "<=<" "<<=" "<==" "<==>" "=>>" ">=>"
      "=>" ">>=" ">>-" ">-" "<~>" "-<" "-<<" "=<<" "---" "<-|"
      "<=|" "/\\" "\\/" "|=>" "|~>" "<~~" "<~" "~~" "~~>" "~>"
      "<$>" "<$" "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</>" "</" "/>"
      "<->" "..<" "~=" "~-" "-~" "~@" "^=" "-|" "_|_" "|-" "||-"
      "|=" "||=" "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#="
      "&=";; "..." ".." "//" "##"
       ))

(sort jetbrains-ligature-mode--ligatures (lambda (x y) (> (length x) (length y))))

(dolist (pat jetbrains-ligature-mode--ligatures)
   (set-char-table-range composition-function-table
                       (aref pat 0)
                       (nconc (char-table-range composition-function-table (aref pat 0))
                              (list (vector (regexp-quote pat)
                                            0
                                        'compose-gstring-for-graphic)))))

(defun load-prettify-symbols ()
        (setq prettify-symbols-alist
                      '(("lambda" . 955)
                        ("alpha" . 945)
                        ("beta" . 946)
                        ("gamma" . 947)
                        ("delta" . 916)
                        ("epsilon" . 949)
                        ("theta" . 920)
                        ("pi" . 960)
                        ("omega" . 937)))
        (prettify-symbols-mode 1))

(add-hook 'org-mode-hook 'load-prettify-symbols)
(add-hook 'python-mode-hook 'load-prettify-symbols)
(add-hook 'java-mode-hook 'load-prettify-symbols)





(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))



(setq org-todo-keywords
      '((sequence "TODO(t)" "GOAL(g)" "LATER(l)" "|" "DONE(d)" "CANCELED(c)")
        (sequence "LECTURE(l)" "MANDATORY(m)" "|" "CANCELED(c)")))
(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "#ff781f" :weight bold))
        ("DONE" . "#1aca0a")
        ("LECTURE" . "#1aca0a")
        ("MANDATORY" . (:foreground "#ff2626" :weight bold))))

(setq org-agenda-start-day "+0d"
      org-agenda-span 7)

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "●" "◉" "●" "◉" "●" "◉")))

(with-eval-after-load 'org
  (org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
      (python . t)
      (java . t)
      (haskell . t)
      (JavaScript . t)))
  (push '("conf-unix" . conf-unix) org-src-lang-modes))

(defun efs/org-babel-tangle-config ()
  (when (string-equal (file-name-directory (buffer-file-name))
                      (expand-file-name user-emacs-directory))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))
(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'efs/org-babel-tangle-config)))

(use-package ox-reveal
  :ensure ox-reveal)
(setq org-reveal-root "https://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)

(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (setq lsp-inhibit-message t
        lsp-eldoc-render-all nil
        lsp-enable-file-watchers nil
        lsp-enable-symbol-highlighting t
        lsp-headerline-breadcrumb-enable nil
        lsp-highlight-symbol-at-point nil
        lsp-modeline-code-actions-enable t
        lsp-modeline-diagnostics-enable nil
        lsp-enable-which-key-integration t)
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-idle-delay 0.500))

(use-package lsp-Ivy
  :after lsp)

(use-package yasnippet :config (yas-global-mode))

(use-package flycheck
  :init
  (add-to-list 'display-buffer-alist
               `(,(rx bos "*Flycheck errors*" eos)
                 (display-buffer-reuse-window
                  display-buffer-in-side-window)
                 (side            . bottom)
                 (reusable-frames . visible)
                 (window-height   . 0.12))))

(use-package lsp-java :config (add-hook 'java-mode-hook 'lsp))
(use-package dap-java
  :ensure t
  :after (lsp-java)

  ;; The :bind here makes use-package fail to lead the dap-java block!
   :bind
   (("C-c R" . dap-java-run-test-class)
    ("C-c d" . dap-java-debug-test-method)
    ("C-c r" . dap-java-run-test-method)
    )

  :config
  (global-set-key (kbd "<f7>") 'dap-step-in)
  (global-set-key (kbd "<f8>") 'dap-next)
  (global-set-key (kbd "<f9>") 'dap-continue)
  )
(use-package hydra)
(use-package company)
(use-package company-lsp)
(use-package helm-lsp)
(use-package helm)

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/coding/java")
    (setq projectile-project-search-path '("~/coding/python")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :after projectile
  :config (counsel-projectile-mode))

(use-package magit
  :commands magit-status
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; NOTE: Make sure to configure a GitHub token before using this package!
;; - https://magit.vc/manual/forge/Token-Creation.html#Token-Creation
;; - https://magit.vc/manual/ghub/Getting-Started.html#Getting-Started
(use-package forge
  :after magit)

(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(setq gc-cons-threshold (* 2 1000 1000))
