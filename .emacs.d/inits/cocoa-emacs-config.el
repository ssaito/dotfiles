;;; package --- emacs settings for Cocoa(Mac)
;;; Commentary:

;;; Code:
(define-key global-map [?¥] [?\\])  ;; ¥の代わりにバックスラッシュを入力する

; tmux 上の emacsのクリップボード共有
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))
(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))
(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(provide '99-cocoa-emacs-config)
;;; cocoa-emacs-config.el ends here
