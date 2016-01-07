;;; -*- coding: utf-8; mode: emacs-lisp; -*-
;;; 30-auto-complete.el
;;
;; 賢い自動補完機能
;; -----------------------------------------

(el-get-bundle auto-complete)
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(ac-config-default)

(ac-set-trigger-key "TAB")
;; 補完メニュー表示時にC-n/C-pで補完候補選択
(setq ac-use-menu-map t)
;; 曖昧マッチ
(require 'fuzzy)
(setq ac-use-fuzzy t)
;; 空気を読む挙動
(setq ac-dwim t)

;; 補完機能のソース共通
;; * ac-source-filename
;;   ファイル名
;; * ac-source-words-in-same-mode-buffers
;;   同じメジャーモードのバッファ内の単語
;; * ac-source-yasnippet
;;   スニペット
(setq-default ac-sources '(ac-source-filename
                           ac-source-words-in-same-mode-buffers
                           ac-source-yasnippet))


;; 補完の自動起動をOFF
(setq ac-auto-start nil)
; M-TABで補完開始
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)  

;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))))
(real-global-auto-complete-mode t)
