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

;; 文字だけでなく "#" の色も変える
;; (add-to-list 'markdown-mode-font-lock-keywords-basic
;;              (cons markdown-regex-header-1-atx
;;                    '((1 markdown-header-face-1)
;;                      (2 markdown-header-face-1)
;;                      (3 markdown-header-face-1))))
;; (add-to-list 'markdown-mode-font-lock-keywords-basic
;;              (cons markdown-regex-header-2-atx
;;                    '((1 markdown-header-face-2)
;;                      (2 markdown-header-face-2)
;;                      (3 markdown-header-face-2))))
;; (add-to-list 'markdown-mode-font-lock-keywords-basic
;;              (cons markdown-regex-header-3-atx
;;                    '((1 markdown-header-face-3)
;;                      (2 markdown-header-face-3)
;;                      (3 markdown-header-face-3))))
;; (add-to-list 'markdown-mode-font-lock-keywords-basic
;;              (cons markdown-regex-header-4-atx
;;                    '((1 markdown-header-face-4)
;;                      (2 markdown-header-face-4)
;;                      (3 markdown-header-face-4))))
;; (add-to-list 'markdown-mode-font-lock-keywords-basic
;;              (cons markdown-regex-header-5-atx
;;                    '((1 markdown-header-face-5)
;;                      (2 markdown-header-face-5)
;;                      (3 markdown-header-face-5))))
;; (add-to-list 'markdown-mode-font-lock-keywords-basic
;;              (cons markdown-regex-header-6-atx
;;                    '((1 markdown-header-face-6)
;;                      (2 markdown-header-face-6)
;;                      (3 markdown-header-face-6))))

(provide '80-markdown)
;;; 80-markdown.el ends here
