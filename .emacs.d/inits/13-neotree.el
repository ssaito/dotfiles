;;; pakcage --- setting for neotreee
;;; Commentary:

;;; Code:
;; icon のパッケージ
(use-package all-the-icons
    :straight t)
(use-package neotree
  :straight t
  :after projectile
  :bind (([f8] . neotree-toggle))
  :commands
  (neotree-show neotree-hide neotree-dir neotree-find)
  :config
  ; neotree にアイコンを反映
  ; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-smart-open t)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  ; 隠しファイルを表示
  (setq-default neo-show-hidden-files t)
  ; file開いたときにディレクトリを切り替えない
  (setq neo-autorefresh nil))

(provide '13-neotreee)
;;; 13-neotreee.el ends here
