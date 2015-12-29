; ref http://wwwuser.gwdg.de/~jkremer/pandoc-mode.html
; ref ~/.emacs.d/el-get/pandoc-mode/manual/pandoc-mode.text

(load "pandoc-mode")

; 拡張子 .md .txt .text を開いたら自動的に pandoc-mode にする
(add-hook 'markdown-mode-hook 'turn-on-pandoc)
