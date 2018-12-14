;;; package --- yaml のメジャーモードの設定
;;; Commentary:
;;;  yaml-mode

;;; Code:

; パッケージの指定
(use-package yaml-mode
  :straight t)

; 拡張子 .json を開いたら自動的にjson-mode にする
(setq auto-mode-alist (append
                       '(("\\.yaml$" . yaml-mode)
                         ("\\.yml$" . yaml-mode)
                         ) auto-mode-alist))



