;;; 99-common-config --- common configurations
;;; Commentary:
;; 基本的な共通設定
;;; Code:

;; recentf の拡張。最近開いたファイルリストが便利になる
(use-package recentf-ext
  :straight t)
;; 一時的なファイル作成 
(use-package open-junk-file
  :straight t)

; 日本語設定
(set-language-environment 'Japanese)

; エンコード UTF-8
(prefer-coding-system 'utf-8-unix)

; emacs25 の描画を軽くする
(setq-default bidi-display-reordering nil
              bidi-paragraph-direction (quote left-to-right))

; emacs-server 起動。emacsclient を使えるようにする
(server-start)

; エラーのヒープ音を消す
(setq ring-bell-function 'ignore)

; スタートアップ非表示
(setq inhibit-startup-screen t)

; scratchの初期メッセージ消去
(setq initial-scratch-message "")

; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

; ミニバッファの履歴の保存数を増やす
(setq history-length 30000)

; バックアップファイルを残さない
(setq make-backup-files nil)

; 1行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

; open-junk-file
; http://d.hatena.ne.jp/rubikitch/20080923/1222104034
; 一時ファイルの作成
(require 'open-junk-file)
(defun open-junk-file ()
  (interactive)
  (let* ((file (expand-file-name
                (format-time-string
                 "%Y/%m/%Y-%m-%d-%H%M%S.txt" (current-time))
                "~/junk/"))
         (dir (file-name-directory file)))
    (make-directory dir t)
    (find-file-other-window file)))

; シンボリックリンクを開いた時の質問を消す
(setq vc-follow-symlinks t)

; recentfの履歴を無制限にする
(setq recentf-max-saved-items nil)

;; Emacs Command Historyを保存する
(savehist-mode 1)

;; 常に適用されるマイナーモードは表示しない
(setq my_hidden-minor-modes
      '(yas-minor-mode
        eproject-mode
        helm-mode
        company-mode
        counsel-mode
        ivy-mode
        eldoc-mode
        projectile-mode))
(mapc (lambda (mode)
        (setq minor-mode-alist
              (cons (list mode "")
                    (assq-delete-all mode minor-mode-alist))))
      my_hidden-minor-modes)

;; 自分用のヘルプ
(defun my-help ()
  (interactive)
 (switch-to-buffer (buffer-name (find-file-noselect "~/.emacs.d/my-help.md"))))

(provide '99-common-config)
;;; 99-common-config.el ends here
