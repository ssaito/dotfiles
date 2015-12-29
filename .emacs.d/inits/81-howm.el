(add-to-list 'load-path "~/.emacs.d/elisp/manual-install/howm-1.4.2")
(global-set-key "\C-c,," 'howm-menu)
(autoload 'howm-menu "howm" "Hitori Otegaru Wiki Modoki" t)

;; ファイル置き場
(setq howm-directory "~/Dropbox/private/howm")

;; menuに表示されるスケジュール日数
(setq howm-menu-schedule-days 60)

;;howm 1 日 1 ファイル (メモ置き場/年/月/年_月_日.txt に)
(setq howm-file-name-format "%Y/%m/%Y_%m_%d.txt")
