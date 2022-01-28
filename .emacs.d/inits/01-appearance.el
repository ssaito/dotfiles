;;; -*- coding: utf-8; mode: emacs-lisp; -*-
;;; 01-apperance.el
;;
;; 見た目の設定
;; -----------------------------------------

; x-window 時のみの設定
(if window-system (progn
  ; ウィンドウの透過設定
  (set-frame-parameter (selected-frame) 'alpha '(95 85))
  ; 画面の隙間
  (fringe-mode 2)
  ; スクロールバー非表示
  (set-scroll-bar-mode nil)
  ; タイトルバーにファイルのフルパス表示
  (setq frame-title-format
      (format "%%f" (system-name)))))

;; for emacs 2.7
(setq custom--inhibit-theme-enable nil)

;; カラーテーマ
(use-package monokai-theme
  :straight t)

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))
(add-hook 'window-setup-hook 'on-after-init)

; ツールバー非表示
(tool-bar-mode -1)

; メニューバー非表示
(menu-bar-mode -1)

; 括弧の範囲内を強調表示
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'mixed)

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

; 行番号表示
(global-linum-mode t)

; 行番号の見た目
(if window-system
    (progn (set-face-attribute 'linum nil
                   :foreground "#A6E22E"))
    (progn (set-face-attribute 'linum nil
                   :background "black"
                   :foreground "#A6E22E")))

; 行番号フォーマット
(setq linum-format "%5d ")

; 行番号を表示しないモードの設定
(setq linum-mode-inhibit-modes-list '(eshell-mode
                                      shell-mode
                                      calendar-mode
                                      eww-mode
                                      inf-ruby-mode
                                      dirtree-mode))
(defadvice linum-on (around linum-on-inhibit-for-modes)
  "Stop the load of linum-mode for some major modes."
  (unless (member major-mode linum-mode-inhibit-modes-list)
    ad-do-it))
(ad-activate 'linum-on)

; warning のレベルを emergency に変更
(setq warning-minimum-level :emergency)
