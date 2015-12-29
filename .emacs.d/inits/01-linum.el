;;; -*- coding: utf-8; mode: emacs-lisp; -*-
;;; 01-linum.el
;;
;; 行番号の表示
;; usage M-x linum-mode
;; manual default
;; -----------------------------------------

; 行番号表示
(global-linum-mode t)

; 行番号の見た目
(set-face-attribute 'linum nil
;                    :background "black"
;                    :foreground "white"
;                    :height 0.8)
                    )

; 行番号フォーマット
(setq linum-format "%4d ")

; 行番号を表示しないモードの設定
(setq linum-mode-inhibit-modes-list '(eshell-mode
                                      shell-mode
                                      calendar-mode
                                      eww-mode
                                      inf-ruby-mode
                                      dirtree-mode))
(defadvice linum-on (around linum-on-inhibit-for-modes)
  "Stop the load of linum-mode for some major modes."
  (unless (member major-mode linum-mode-inhibit-modes-list)
    ad-do-it))
(ad-activate 'linum-on)
