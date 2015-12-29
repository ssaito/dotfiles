;; web-mode setting
(require 'web-mode)
;; *.phtml, *.html, *.htm, *.tpl.php, *.jsp, *.ascx, *.aspx, *.erb
(add-to-list 'auto-mode-alist '("\\.p?html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

;; key-bind
(define-key web-mode-map (kbd "C-c C-n") 'web-mode-element-next)
(define-key web-mode-map (kbd "C-c C-p") 'web-mode-element-previous)
(define-key web-mode-map (kbd "C-c C-l") 'web-mode-element-parent)
(define-key web-mode-map (kbd "C-c C-m") 'web-mode-mark-and-expand)

(require 'smartrep)
(smartrep-define-key web-mode-map "C-c"
  '(("C-n" . web-mode-element-next)
    ("C-p" . web-mode-element-previous)
    ("C-l" . web-mode-element-parent)
    ("C-m" . web-mode-mark-and-expand)))








