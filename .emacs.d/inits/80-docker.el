;;; package --- docker関連のパッケージ設定
;;; Commentary:
;;;  dockerfile-mode
;;;  docker-compose-mode

;;; Code:

; Dockerfileのシンタックスハイライトなど
(use-package dockerfile-mode
  :straight t
  :mode "Dockerfile.*")

; docker-compose の yaml ファイルのキーワード補完など
(use-package docker-compose-mode
  :straight t)
