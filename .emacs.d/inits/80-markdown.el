;;; package --- Markdownのメジャーモードの設定
;;; Commentary:
;;;  markdown-modeは使わずgfm-modeを使う

;;; Code:
(require 'markdown-mode)

; 拡張子 .md .txt .text を開いたら自動的に gfm-mode(GitHub Flavored Markdown) にする
(setq auto-mode-alist (append
 '(
    ("\\.md$" . gfm-mode)
    ("\\.txt$" . gfm-mode)
    ("\\.text$" . gfm-mode)
  ) auto-mode-alist))

;; Enter押したときのオートインデントをOFF
(setq markdown-indent-on-enter nil)

;; ヘッダーの色を org-mode に合わせる
(custom-set-faces
 '(markdown-header-face-1 ((t (:inherit org-level-1))))
 '(markdown-header-face-2 ((t (:inherit org-level-2))))
 '(markdown-header-face-3 ((t (:inherit org-level-3))))
 '(markdown-header-face-4 ((t (:inherit org-level-4))))
 '(markdown-header-face-5 ((t (:inherit org-level-5))))
 '(markdown-header-face-6 ((t (:inherit org-level-6))))
 )

; ref http://wwwuser.gwdg.de/~jkremer/pandoc-mode.html
; ref ~/.emacs.d/el-get/pandoc-mode/manual/pandoc-mode.text
; pandoc
(load "pandoc-mode")

; 拡張子 .md .txt .text を開いたら自動的に pandoc-mode にする
(add-hook 'markdown-mode-hook 'turn-on-pandoc)



(provide '80-markdown)
;;; 80-markdown.el ends here
