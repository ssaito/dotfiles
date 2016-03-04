(el-get-bundle company-mode)

; 全バッファで有効にする 
(global-company-mode)
; delay を0に
(setq company-idle-delay 0) 
; 補完を開始する文字数
(setq company-minimum-prefix-length 2)
; 候補の一番下でさらに下に行こうとすると一番上に戻る
(setq company-selection-wrap-around t)

; key
(define-key company-active-map (kbd "M-n") nil) ; M-n のキーバインドなし
(define-key company-active-map (kbd "M-p") nil) ; M-p のキーバイドなし
; C-n 次の候補へ
(define-key company-active-map (kbd "C-n") 'company-select-next)
; C-p 前の候補へ
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-h") nil) ; C-h のキーバイドなし
(global-set-key (kbd "M-/") 'company-complete) ;M-/ で補完開始

; 1つしか候補がなかったらtabで補完、複数候補があればtabで次の候補へ行くように
(define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
; backtab(Shift+tab): 一つ前の候補に戻る
(define-key company-active-map (kbd "backtab") 'company-select-previous)

; face
(set-face-attribute 'company-tooltip nil
                    :foreground "black"
                    :background "lightgrey")
(set-face-attribute 'company-tooltip-selection nil
                    :foreground "black"
                    :background "steelblue")
(set-face-attribute 'company-tooltip-common nil
                    :foreground "black"
                    :background "lightgrey")
(set-face-attribute 'company-tooltip-common-selection nil
                    :foreground "white"
                    :background "steelblue")
(set-face-attribute 'company-tooltip-annotation nil
                    :foreground "steelblue"
                    :background "lightgrey")
(set-face-attribute 'company-preview-common nil
                    :background nil
                    :foreground "lightgrey"
                    :underline t)
(set-face-attribute 'company-scrollbar-fg nil
                    :background "orange")
(set-face-attribute 'company-scrollbar-bg nil
                    :background "gray40")
