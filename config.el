;;; package --- Summary
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; Commentary:
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;;; Code:
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Nhan Vu"
      user-mail-address "nhanvu@yandex.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "JetBrains Mono" :size 14))
(setq doom-font (font-spec :family "Source Code Pro" :size 13))

;; Enable solaire-mode
;; solaire-mode must be enabled before load theme
(solaire-global-mode +1)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-solarized-dark)
(setq doom-theme 'doom-solarized-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")
(setq org-todo-state-tags-triggers '((("CANCELLED" ("ARCHIVE" ("DONE" . t))))))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
(custom-set-variables)
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(package-selected-packages
   ;; '(gitlab-ci-mode yasnippet visual-fill-column ssh-config-mode rainbow-identifiers php-mode nginx-mode lsp-docker hcl-mode docker-compose-mode ansible)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; org-roam
(setq org-roam-directory "~/Dropbox/org/")
(add-hook 'after-init-hook 'org-roam-mode)

;; lsp-mode config
(setq read-process-output-max (* 4096 4096)) ;; 1mb
(setq lsp-idle-delay 0.500)
(setq lsp-completion-provider t)

;; company-mode
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0) ;; default is 0.2

;; telega configs
;; ignore V (spammer in group linuxvn)
(defun my-telega-ignore-1207542043-user (msg &rest notused)
  (let ((sender (telega-msg-sender msg)))
    (when (and (telega-user-p sender)
             (= (plist-get sender :id) 1207542043))
      (telega-msg-ignore msg))))

(add-hook 'telega-chat-insert-message-hook 'my-telega-ignore-1207542043-user)

;; magit configs
;;
;; Auto refresh magit buffers
(add-hook 'after-save-hook 'magit-after-save-refresh-status t)
;;
;; Enable plantuml-mode for PlantUML files
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))

;; lsp-ui configs
;; ref: https://github.com/emacs-lsp/lsp-ui
;; (setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-ui-sideline-enable t)
(setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-sideline-ignore-duplicate t)
(setq lsp-ui-sideline-show-diagnostics t)
(setq lsp-ui-sideline-show-symbol t)
(setq lsp-ui-sideline-show-code-actions t)
(setq lsp-ui-sideline-toggle-symbols-info t)
(setq lsp-headerline-breadcrumb-enable t)
(setq lsp-lens-enable t)
(setq lsp-ui-sideline-show-code-actions t)
(setq lsp-ui-sideline-enable t)
(setq lsp-modeline-code-actions-enable t)
(setq lsp-diagnostics-provider :flycheck)


;;; config.el ends here
