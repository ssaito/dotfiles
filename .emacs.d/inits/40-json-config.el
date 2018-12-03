;;; 40-json-config --- common configurations
;;; Commentary:
;; JSONの設定
;;; Code:

(use-package json-mode
  :straight t
  :mode "\\.json\\"
  :config (setq-default json-reformat:indent-width 2
                        json-indent-level 2))


(provide '40-json-config)
;;; 99-json-config.el ends here
