;;; -*- coding: utf-8; mode: emacs-lisp; -*-
;;; 00-el-get-bundle.el
;;; Commentary:
;; パッケージリポジトリの指定
;; -----------------------------------------
;;; Code:
(require 'el-get-elpa)
(unless (file-directory-p el-get-recipe-path-elpa)
  (el-get-elpa-build-local-recipes))

<<<<<<< HEAD
;; recentf の拡張。最近開いたファイルリストが便利になる
(el-get-bundle recentf-ext)
;; 一時的なファイル作成 
(el-get-bundle open-junk-file)
;; ローマ字入力で日本語検索
(el-get-bundle migemo)
;; 起動時のダッシュボード
; (el-get-bundle dashboard)
=======
>>>>>>> 7ce62f0e8af78b81fbee8ee47bf2b61feb4315a0

;; 入力支援
(el-get-bundle yasnippet)
(el-get-bundle fuzzy)


;; for ruby
(el-get-bundle ruby-mode)
(el-get-bundle ruby-end)
(el-get-bundle ruby-block)
(el-get-bundle inf-ruby)

;; メジャーモード
(el-get-bundle yaml-mode)
(el-get-bundle php-mode)
(el-get-bundle js2-mode)
(el-get-bundle web-mode)
(el-get-bundle pandoc-mode)
(el-get-bundle markdown-mode)
(el-get-bundle json-mode)
(el-get-bundle textile-mode)
(el-get-bundle smartrep)

;; IDE的なビューや機能を提供する
(el-get-bundle eproject)

;; helm
;(el-get-bundle helm)
;(el-get-bundle helm-descbinds)
;(el-get-bundle helm-ag)

(el-get-bundle elpa:counsel)

;; 範囲を選択するときに単語→シンボル→S式と広げてくれる便利マイナーモード
(el-get-bundle expand-region)

;; git 用
;;(el-get-bundle magit)

;; インデントをわかりやすくハイライトしてくれる
(el-get-bundle! highlight-indentation)

(provide '00-el-get-bundle.el)
;;; 00-el-get-bundle.el ends here
