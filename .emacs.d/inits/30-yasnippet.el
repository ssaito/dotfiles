;;; 30-yasnippet.el --- yasnippet configurations
;;; Commentary:
;; コードニスペットを扱えるようにする
;; ref http://fukuyama.co/yasnippet
;;; Code:

(use-package yasnippet
  :straight t)
(yas-global-mode 1)

;; 単語展開キーバインド (ver8.0から明記しないと機能しない)
(custom-set-variables '(yas-trigger-key "TAB"))
;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

;; snippet-mode を適用するファイル *.yasnippet
(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))

;; 作成するsnippetのテンプレート
(custom-set-variables '(yas-new-snippet-default "\
# -*- mode: snippet -*-
# name: $1
# key: ${2:${1:$(yas--key-from-desc yas-text)}}
# expand-env: ((yas/indent-line 'fixed) (yas/wrap-around-region 'nil))
# --
$0"))

;; helm interface
;; http://d.hatena.ne.jp/syohex/20121207/1354885367
(defun my-yas/prompt (prompt choices &optional display-fn)
  (let* ((names (loop for choice in choices
                      collect (or (and display-fn (funcall display-fn choice))
                                  choice)))
         (selected (helm-other-buffer
                    `(((name . ,(format "%s" prompt))
                       (candidates . names)
                       (action . (("Insert snippet" . (lambda (arg) arg))))))
                    "*helm yas/prompt*")))
    (if selected
        (let ((n (position selected names :test 'equal)))
          (nth n choices))
      (signal 'quit "user quit!"))))
(custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))
