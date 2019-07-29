;;; 01-highlight-indentation.el --- Summury
;;; Commentary:
;;; -*- coding: utf-8; mode: emacs-lisp; -*-
;;
;; インデントのハイライトを行うマイナーモードの設定
;; -----------------------------------------

;;; Code:
(use-package highlight-indent-guides
  :straight t
  :config
  (highlight-indent-guides-auto-enabled t)
  (highlight-indent-guides-responsive t)
  (highlight-indent-guides-method 'column))
