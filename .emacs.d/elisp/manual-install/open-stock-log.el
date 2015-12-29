;;; open-stock-log.el --- Open a junk (memo) file to try-and-error
;; based on open-junk-fil (http://d.hatena.ne.jp/rubikitch/20080923/1222104034)
;; $Id: open-junk-file.el,v 1.3 2010/06/18 20:07:49 rubikitch Exp rubikitch $

;; Copyright (C) 2013 Shinya Saito

;; Author: Shinya Saito <shinya.saito.25a@gmail.com>
;; Keywords: tools
;; URL:

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commands:
;;
;; Below are complete command list:
;;
;;  `open-stock-log'
;;    Open a new file whose filename is derived from current time.
;;
;;; Customizable Options:
;;
;; Below are customizable option list:
;;
;;  `open-stock-log-format'
;;    *File format to put junk files with directory.
;;    default = "~/junk/%Y/%m/%d-%H%M%S."
;;  `open-stock-log-function'
;;    *Function to open junk files.
;;    default = (quote find-file-other-window)

;;; Installation:
;;
;; Put open-junk-file.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'open-stop-log)
;;
;; No need more.

;;; Customize:
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET open-junk-file RET
;;

;;; Code:

(defvar open-stock-log-version "$Id: open-stock-log.el,v 0.1 $")
(eval-when-compile (require 'cl))
(defgroup open-stock-log nil
  "open-stock-log"
  :group 'emacs)
(defcustom open-stock-log-format "~/Dropbox/private/stock_log/logs/%Y/%m/%d-%H%M%S.yml"
  "*File format to put junk files with directory.
It can include `format-time-string' format specifications."
  :type 'string  
  :group 'open-stock-log)
(defvaralias 'open-stock-log-format 'open-stock-log-directory)
(defcustom open-stock-log-find-file-function 'find-file
  "*Function to open junk files."
  :type 'function  
  :group 'open-stock-log)

(defun open-stock-log ()
  "Open a new file whose filename is derived from current time.
 You can write short program in it. It helps to try-and-error programs.

For example, in Emacs Lisp programming, use M-x `open-stock-log'
instead of *scratch* buffer. The junk code is SEARCHABLE."
  (interactive)
  (let* ((file (format-time-string open-stock-log-format (current-time)))
         (dir (file-name-directory file)))
    (make-directory dir t)
    (funcall open-stock-log-find-file-function (read-string "Junk Code (Enter extension): " file))))

;;;; Bug report
(defvar open-stock-log-maintainer-mail-address
  (concat "rubiki" "tch@ru" "by-lang.org"))
(defvar open-stock-log-bug-report-salutation
  "Describe bug below, using a precise recipe.

When I executed M-x ...

How to send a bug report:
  1) Be sure to use the LATEST version of open-stock-log.el.
  2) Enable debugger. M-x toggle-debug-on-error or (setq debug-on-error t)
  3) Use Lisp version instead of compiled one: (load \"open-stock-log.el\")
  4) If you got an error, please paste *Backtrace* buffer.
  5) Type C-c C-c to send.
# If you are a Japanese, please write in Japanese:-)")
(defun open-stock-log-send-bug-report ()
  (interactive)
  (reporter-submit-bug-report
   open-stock-log-maintainer-mail-address
   "open-stock-log.el"
   (apropos-internal "^open-stock-log-" 'boundp)
   nil nil
   open-stock-log-bug-report-salutation))

(provide 'open-stock-log)

;; How to save (DO NOT REMOVE!!)
;; (emacswiki-post "open-stock-log.el")
;;; open-junk-file.el ends here
