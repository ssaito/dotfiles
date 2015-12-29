;;; 00-global-key.el --- 共通キーバインドの設定
;;; Commentary:
;; 設定はシンプル
;;; Code:

(global-unset-key (kbd "C-l")) ;C-l プレフィックス
(global-set-key (kbd "C-h") 'backward-delete-char);C-h でBackSpace
(global-set-key (kbd "M-h") 'backward-kill-word) ;M-h 直前の単語を削除
(global-set-key (kbd "C-m") 'newline-and-indent) ;C-m 改行後にインデント
(global-set-key (kbd "C-z") 'undo) ;Undo はC-z
(global-set-key (kbd "C-l C-l") 'recenter-top-bottom) ;C-l C-l カーソルをバッファの中央へ
(global-set-key (kbd "C-l r") 'query-replace) ;置換
(global-set-key (kbd "C-l R") 'query-replace-regexp) ;正規表現置換

(provide '00-global-key)
;;; 00-global-key.el ends here
