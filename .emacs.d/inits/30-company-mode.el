(el-get-bundle company-mode)

; 全バッファで有効にする 
(global-company-mode)
; delay を0に
(setq company-idle-delay 0) 
; 補完を開始する文字数
(setq company-minimum-prefix-length 3)
; 候補の一番下でさらに下に行こうとすると一番上に戻る
(setq company-selection-wrap-around t)

; key
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-h") nil)
(global-set-key (kbd "M-/") 'company-complete) 

(defun company--insert-candidate2 (candidate)
  (when (> (length candidate) 0)
    (setq candidate (substring-no-properties candidate))
    (if (eq (company-call-backend 'ignore-case) 'keep-prefix)
        (insert (company-strip-prefix candidate))
      (if (equal company-prefix candidate)
          (company-select-next)
          (delete-region (- (point) (length company-prefix)) (point))
        (insert candidate))
      )))

(defun company-complete-common2 ()
  (interactive)
  (when (company-manual-begin)
    (if (and (not (cdr company-candidates))
             (equal company-common (car company-candidates)))
        (company-complete-selection)
      (company--insert-candidate2 company-common))))

; tab: 候補が１つならそれを選択する。候補が複数の場合、挿入可能な prefix があれば挿入し、なければ次の候補
(define-key company-active-map [tab] 'company-complete-common2)
; backtab(Shift+tab): 一つ前の候補に戻る
(define-key company-active-map [backtab] 'company-select-previous)
