;;; ruby-settings.el --- ruby settings
;;; Commentary:
;; REPL buffer, debugger, yaml
;;; Code:
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;; inf-ruby
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")

; change inf-ruby to pry
(setq inf-ruby-default-implementation "pry")
(setq inf-ruby-eval-binding "Pry.toplevel_binding")
;; riなどのエスケープシーケンスを処理し、色付けする
(add-hook 'inf-ruby-mode-hook 'ansi-color-for-comint-mode-on)

(setq inf-ruby-first-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)> *")
(setq inf-ruby-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)[>*\"'] *")


(add-hook 'ruby-mode-hook
   '(lambda () (inf-ruby-keys)))
(global-font-lock-mode 1)

;; ruby-block
;; install by el-get
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle 'overlay)

;; YAML
;; install by el-get
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(provide ruby-settings)
;;; ruby-settings.el ends here
