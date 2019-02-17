;;; package --- yaml のメジャーモードの設定
;;; Commentary:
;;;  yaml-mode

;;; Code:

; パッケージの指定
(use-package yaml-mode
  :straight t
  :mode ("\\.yaml$\\'"
        "\\.yml$\\'"))
