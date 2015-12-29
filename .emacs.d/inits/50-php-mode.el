;; PHP メジャーモード
; install el-get
(require 'php-mode)

; タブ幅
(add-hook 'php-mode-user-hook
          '(lambda ()
             (setq tab-width 2)
             (setq indent-tabs-mode nil))
          )
