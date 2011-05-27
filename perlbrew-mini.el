;;; perlbrew-mini.el --- A simple perlbrew wrapper for Emacs

;; Copyright (C) 2011 Damien Krotkine

;; Author: Damien Krotkine <dams@cpan.org>
;; Keywords: Emacs, Perl, perlbrew

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; (require 'perlbrew-mini)
;; (perlbrew-mini-set-perls-dir "/home/damien/perl5/perlbrew/perls/") ;; set to the directory containing all the perls
;; (perlbrew-mini-use "perl-5.12.3") ;; initialize perl version to use

;; Later on, the following lisp functions will be available :
;;   perlbrew-get-current-perl-path ;; returns the current perl path
;;   perlbrew-get-current-version ;; returns the current perl version in use

;; These functions are especially useful with flymake.

;;; Code:

(defvar perlbrew-mini-perls-dir nil)
(defvar perlbrew-mini-current-perl-path nil)
(defvar perlbrew-mini-current-version nil)

(defun perlbrew-mini-use (version)
  (perlbrew-mini-set-current-version version )
  (perlbrew-mini-set-current-perl-path)
)

(defun perlbrew-mini-set-perls-dir (path)
  (setq perlbrew-mini-perls-dir path)
)


(defun perlbrew-mini-get-current-perl-path ()
  perlbrew-mini-current-perl-path)

(defun perlbrew-mini-set-current-perl-path ()
  (setq perlbrew-mini-current-perl-path
	(perlbrew-mini-join2
	 (list perlbrew-mini-perls-dir perlbrew-mini-current-version "/bin/perl")
	)
  )
)

(defun perlbrew-mini-set-current-version (version)
  (setq perlbrew-mini-current-version version))

(defun perlbrew-mini-join2 (list)
  (mapconcat 'identity list ""))

(provide 'perlbrew-mini)
;;; perlbrew-mini.el ends here
