;;; -*- coding: utf-8; mode: emacs-lisp; -*-
;;; 01-apperance.el
;;
;; 見た目の設定
;; -----------------------------------------

; ウィンドウの透過設定
(if window-system (progn
  (set-frame-parameter (selected-frame) 'alpha '(95 85))
))
 
; 画面の隙間
(fringe-mode 2)

; カラーテーマ
; sublime-themes
(load-theme 'monokai t)

; ツールバー非表示
(tool-bar-mode -1)

; メニューバー非表示
(menu-bar-mode -1)

; スクロールバー非表示
(set-scroll-bar-mode nil)

; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (format "%%f" (system-name)))

; 括弧の範囲内を強調表示
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

; 選択領域の色
(set-face-background 'region "white")
(set-face-foreground 'region "black")

;ミニバッファ用
(face-spec-set 'minibuffer-prompt
                '((((class color) (background light))
                  (:foreground "cyan"))
                  (t (:foreground "white" :background "brown"))))

; タブをスペースで扱う
(setq-default indent-tabs-mode nil)

; タブ幅
(custom-set-variables '(tab-width 2))

; モードラインに行番号表示
(line-number-mode t)

; モードラインに列番号表示
(column-number-mode t)

; カーソルの形を中抜き四角
(add-to-list 'default-frame-alist '(cursor-type . 'hollow))

; 行間
(setq-default line-spacing 0)

; GUIで起動した場合、選択した領域をクリップボードにコピーすることを有効
(cond (window-system
       (setq x-select-enable-clipboard t)))
