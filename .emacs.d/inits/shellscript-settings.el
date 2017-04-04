;;; package --- Shell-Scriptのメジャーモードの設定
;;; Commentary:

;;; Code:
;; 拡張子.osx, .ubuntu, .win, .local を開いたら自動的に shell-script-mode にする
(setq auto-mode-alist (append
                       '(
                         ("\\.osx" . shell-script-mode)
                         ("\\.ubuntu" . shell-script-mode)
                         ("\\.win" . shell-script-mode)
                         ("\\.local" . shell-script-mode)
                         ) auto-mode-alist))
(setq sh-basic-offset 2)
;;; 40-shell-script-mode.el ends here
