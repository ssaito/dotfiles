;; anything auto-complete tool. next generation "anything"
;; install by cask

(require 'helm-config)
(helm-mode 1)

;; 個人的に便利な source を集めたバッファの定義
;; バッファリスト、ファイル履歴、カレントディレクトリ内のファイルの順で表示する
(defun helm-buffers-recentf-files ()
  (interactive)
  (helm :sources '(
                   helm-source-buffers-list
                   helm-source-recentf
                   helm-source-files-in-current-dir
                   helm-source-buffer-not-found)
        :buffer "*helm buffers recentf filis*"))

;; キーバインド
;; Emacs Command が便利に
(global-set-key (kbd "M-x") 'helm-M-x)
;; 自分で定義したやつ。だいたいこれで事足りる。
(global-set-key (kbd "C-x b") 'helm-buffers-recentf-files)
;; helm-buffers-recentf-files で見つからなかった場合はこちらを使う
(global-set-key (kbd "C-x C-f") 'helm-find-files)
;; buffers-list
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

;; helm-source-buffers-list を詳細に表示しない
(setq helm-buffer-details-flag nil)

;; find-file するときに TABで補完する
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
;; find-file の helm-action は backtab(shift+tab)
(define-key helm-read-file-map (kbd "<backtab>") 'helm-select-action)
(define-key helm-find-files-map (kbd "<backtab>") 'helm-select-action)


;; (defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
;;     "Execute command only if CANDIDATE exists"
;;       (when (file-exists-p candidate)
;;         ad-do-it))

;; Emacs コマンド履歴を保存
(setq helm-M-x-always-save-history t)

;; helm-descbinds
(require 'helm-descbinds)
(helm-descbinds-mode 1)

