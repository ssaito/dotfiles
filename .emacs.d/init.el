;;; package: --- emacs起動時の最初に読み込まれる設定ファイル
;;; Commentary:
;;; el-getとinit-loaderを使って設定ファイルをロード

;;; Code:
;; el-get: elisp のパッケージ管理ツール
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get-bundle emacs-jp/init-loader)

;; init-loader: initsディレクトリ以下をファイルの先頭の数字順に読み込む
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
(provide 'init)
;;; init.el ends here
