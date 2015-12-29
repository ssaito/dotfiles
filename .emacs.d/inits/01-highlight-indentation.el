;;; 01-highlight-indentation.el --- Summury
;;; Commentary:
;;; -*- coding: utf-8; mode: emacs-lisp; -*-
;;
;; インデントのハイライトを行うマイナーモードの設定
;; -----------------------------------------

;;; Code:
;; ハイライトするインデントは幅２
(setq highlight-indentation-mode-hook 2)

;; デフォルトで現在行のインデントハイライトを有効にするモード
(dolist (hook '(yaml-mode-hook
                xml-mode-hook
                python-mode-hook))
  (add-hook hook 'highlight-indentation-current-column-mode-hook))

