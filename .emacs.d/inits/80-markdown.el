;;; package --- Markdownのメジャーモードの設定
;;; Commentary:
;;;  markdown-modeは使わずgfm-modeを使う

;;; Code:
(require 'org)
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


;; header の色を org-mode に合わせて変更
(custom-set-faces
 '(markdown-header-delimiter-face ((t (:inherit default))))
 '(markdown-header-face-1 ((t (:inherit outline-1 :weight bold))))
 '(markdown-header-face-2 ((t (:inherit outline-2 :weight bold))))
 '(markdown-header-face-3 ((t (:inherit outline-3 :weight bold))))
 '(markdown-header-face-4 ((t (:inherit outline-4 :weight bold))))
 '(markdown-header-face-5 ((t (:inherit outline-5 :weight bold))))
 '(markdown-header-face-6 ((t (:inherit outline-6 :weight bold))))
 '(markdown-pre-face ((t (:inherit org-formula))))
 )

; pandoc
(load "pandoc-mode")

; 拡張子 .md .txt .text を開いたら自動的に pandoc-mode にする
(add-hook 'markdown-mode-hook 'turn-on-pandoc)

(provide '80-markdown)
;;; 80-markdown.el ends here
