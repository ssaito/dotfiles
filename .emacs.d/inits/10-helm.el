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
        :fuzzy-match t
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

;; Emacs コマンド履歴を保存
(setq helm-M-x-always-save-history t)

;; face 見た目
(custom-set-faces
  '(helm-ff-directory ((t (:background "#000000" :foreground "#5FD7FF"))))
)

;; helm-descbinds
(require 'helm-descbinds)
(helm-descbinds-mode 1)

;; helm-ag
(require 'helm-ag)
(setq helm-ag-base-command "rg --vimgrep --no-heading")

(defun helm-projectile-ag (&optional options)
  "Helm version of projectile-ag."
  (interactive (if current-prefix-arg (list (read-string "option: " "" 'helm-ag--extra-options-history))))
  (if (require 'helm-ag nil  'noerror)
      (if (projectile-project-p)
          (let ((helm-ag-command-option options)
                (current-prefix-arg nil))
            (helm-do-ag (projectile-project-root) (car (projectile-parse-dirconfig-file))))
        (error "You're not in a project"))
    (error "helm-ag not available")))
