(use-package counsel
  :straight t)

(ivy-mode 1) ;; デフォルトの入力補完がivyになる
;; M-x, C-x C-fなどのEmacsの基本的な組み込みコマンドをivy版にリマップする
(counsel-mode 1)

;;; 下記は任意で有効化
(global-set-key (kbd "C-x C-r") 'ivy-recentf)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)

; M-x の "^" を削除する
(setq ivy-initial-inputs-alist nil)

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")