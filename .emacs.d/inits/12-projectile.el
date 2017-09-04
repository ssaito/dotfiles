;;; pakcage --- setting for projectile
;;; Commentary:

;;; Code:
(el-get-bundle helm-projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; helm-projectile-ag 強力な grep を projectile で使う設定
(defun helm-projectile-ag (&optional options)
  "Helm version of projectile-ag."
  (interactive (if current-prefix-arg (list (read-string "option: " "" 'helm-ag--extra-options-history))))
  (if (require 'helm-ag nil  'noerror)
      (if (projectile-project-p)
          (let ((helm-ag-command-option options)
                (current-prefix-arg nil))
            (helm-do-ag (projectile-project-root) (car (projectile-parse-dirconfig-file))))
        (error "You're not in a project"))
    (error "helm-ag not available")))

(provide '12-projectile)
;;; 12-projectile.el ends here
