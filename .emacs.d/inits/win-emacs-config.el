;;; package --- emacs settings for windows
;;; Commentary: Windows用設定 
;;;  cygwinとの連係、GUIモードの設定(他のプラットフォームではターミナルモードで起動するため)

;;; Code:

;; ファイル名の文字コード設定
(setq default-file-name-coding-system 'shift_jis)
;; text.txt のみMS-dos改行コード設定
(add-hook 'gfm-mode-hook
          '(lambda ()
             (when 
                 (setq buffer-file-coding-system 'utf-8-dos))))

; ダッシュボード
(use-package dashboard
  :straight t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 7)
                          (projects . 7))))

;; GUI上でコピペするときの文字コードは Windowsの場合、utf-16-le を指定する
;; https://rufflewind.com/2014-07-20/pasting-unicode-in-emacs-on-windows
(set-selection-coding-system 'utf-16-le)

;; カッコイイステータスバー
(use-package powerline
    :straight t)
(powerline-default-theme)

;; フォント設定
;; Inconsolata はインストールしないといけない
(set-face-attribute 'default nil
		      :family "Inconsolata"
		      :height 100)
(set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "游ゴシック Medium"
              :height 100))
;; Inconsolataとメイリオの半角:全角の幅が1:2にするための設定
(setq face-font-rescale-alist
	'((".*Inconsolata.*" . 1.2)
	  (".*游ゴシック Medium.*" . 1.0)))
(setq-default line-spacing 0)


;; Cygwin のドライブ・プレフィックスを有効に
(use-package company
    :straight t
    :config
    (cygwin-mount-activate))

;; リモートファイル編集機能の設定
;; ssh が利用できないため PuTTY の plink を代わりに使う
(require 'tramp)
;; plink を使ってリモートファイルにアクセス
(setq tramp-default-method "plink")

;; Windows IME
  (setq default-input-method "W32-IME")
  (setq-default w32-ime-mode-line-state-indicator "[--]")
  (setq w32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
  (w32-ime-initialize)
  ;; 日本語入力時にカーソルの色を変える設定
  (add-hook 'w32-ime-on-hook '(lambda () (set-cursor-color "#A6E22E")))
  (add-hook 'w32-ime-off-hook '(lambda () (set-cursor-color "white")))
  ;; ミニバッファに移動した際は最初に日本語入力が無効な状態にする
  (add-hook 'minibuffer-setup-hook 'deactivate-input-method)

  ;; isearch に移行した際に日本語入力を無効にする
  (add-hook 'isearch-mode-hook '(lambda ()
                                  (deactivate-input-method)
                                  (setq w32-ime-composition-window (minibuffer-window))))
  (add-hook 'isearch-mode-end-hook '(lambda () (setq w32-ime-composition-window nil)))

(provide 'win-emacs-config.el)
;;; win-emacs-config.el ends here
