;; -*- coding: utf-8; mode: emacs-lisp; -*-
;; 30-flycheck.el
;;
;; syntax checker for many language
;; usage auto
;; default package from 24.4
;; -----------------------------------------

;; 静的コード解析ツール
(use-package flycheck
  :straight t)
(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
