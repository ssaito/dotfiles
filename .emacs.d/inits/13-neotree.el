;;; pakcage --- setting for neotreee
;;; Commentary:

;;; Code:
;; icon のパッケージ
(use-package all-the-icons
    :straight t)
(use-package neotree
    :straight t
    :config
    ; neotree にアイコンを反映
    ; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    )


(provide '13-neotreee)
;;; 13-neotreee.el ends here
