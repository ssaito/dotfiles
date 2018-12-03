;;; 01-highlight-indentation.el --- Summury
;;; Commentary:
;;; -*- coding: utf-8; mode: emacs-lisp; -*-
;;
;; インデントのハイライトを行うマイナーモードの設定
;; -----------------------------------------

;;; Code:
(use-package highlight-indent-guides
  :straight t)

(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-auto-enabled nil)
(set-face-background 'highlight-indent-guides-odd-face "darkgray")
(set-face-background 'highlight-indent-guides-even-face "dimgray")
(set-face-foreground 'highlight-indent-guides-character-face "#343434")
