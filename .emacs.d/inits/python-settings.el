(el-get-bundle elpy)

(package-initialize)
(elpy-enable)

;; python の自動補完パッケージ
;;; require pip install jedi
(setq elpy-rpc-backend "jedi")
