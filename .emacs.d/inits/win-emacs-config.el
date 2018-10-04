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

;; カッコイイステータスバー
(el-get-bundle! powerline)
(powerline-default-theme)

;; フォント設定
;; Inconsolata はインストールしないといけない
(set-face-attribute 'default nil
		      :family "Inconsolata"
		      :height 100)
(set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "メイリオ"))
;; Inconsolataとメイリオの半角:全角の幅が1:2にするための設定
(setq face-font-rescale-alist
	'((".*Inconsolata.*" . 1.2)
	  (".*メイリオ.*" . 1.0)))

;; Cygwin のドライブ・プレフィックスを有効に
(el-get-bundle! cygwin-mount)
(cygwin-mount-activate)

;; リモートファイル編集機能の設定
;; ssh が利用できないため PuTTY の plink を代わりに使う
(require 'tramp)
;; plink を使ってリモートファイルにアクセス
(setq tramp-default-method "plink")

;; for el-get
(setq el-get-install-info "C:\\GnuWin32\\bin\\install-info")
(defadvice el-get-build (around use-quote4windows activate)
  (cl-letf (lambda ((w32-shell-dos-semantics () t))
    ad-do-it)))
(setq w32-quote-process-args t)
;; shell-quote-argumentの問題回避
(defvar quote-argument-for-windows-p t "enables `shell-quote-argument' workaround for windows.")
(defadvice shell-quote-argument (around shell-quote-argument-for-win activate)
  "workaround for windows."
  (if (and quote-argument-for-windows-p
           (not (w32-shell-dos-semantics))) ;;el-get利用時の場合は無効にするための判定
      (let ((argument (ad-get-arg 0)))
        (setq argument (replace-regexp-in-string "\\\\" "\\\\" argument nil t))
        (setq argument (replace-regexp-in-string "'" "'\\''" argument nil t))
        (setq ad-return-value (concat "'" argument "'")))
      ad-do-it))

(provide 'win-emacs-config.el)
;;; win-emacs-config.el ends here
