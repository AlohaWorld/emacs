;; Sort the list of Haskell imports at the point alphabetically.
;; Copyright (C) 2010 Chris Done <chrisdone@gmail.com>

;; This module is intended for Haskell mode users, but is
;; independent of Haskell mode.

;; If the region is active it sorts the imports within the
;; region.

;; Example usage:

;; (require 'haskell-sort-imports)
;; (define-key haskell-mode-map (kbd "C-c ." 'haskell-sort-imports)

;; It is particulary effective when used in conjunction with
;; haskell-align-imports.el, e.g.:

;; (require 'haskell-align-imports)
;; (require 'haskell-sort-imports)
;; (define-key haskell-mode-map (kbd "C-c .")
;;   (lambda ()
;;     (interactive)
;;     (let ((col (current-column))) ;; Save the column.
;;       (haskell-align-imports)
;;       (haskell-sort-imports)
;;       (goto-char (+ (point) col))))) ;; Restore the column.

;; This will align and sort the columns of the current import
;; list. It's more or less the coolest thing on the planet.

;; This program is free software: you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of
;; the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.

;; You should have received a copy of the GNU General Public
;; License along with this program.  If not, see
;; <http://www.gnu.org/licenses/>.

(defvar haskell-sort-imports-regexp
  (concat "^\\(import[ ]+\\)"
          "\\(qualified \\)?"
          "[ ]*\\(\"[^\"]*\" \\)?"
          "[ ]*\\([A-Za-z0-9_.']*.*\\)"))

(defun haskell-sort-imports ()
  "Sort the import list at the point."
  (interactive)
  (when (haskell-sort-imports-line-match)
    (let ((current-line (buffer-substring-no-properties
                         (line-beginning-position)
                         (line-end-position)))
          (col (current-column)))
      (if (use-region-p)
          (haskell-sort-imports-at (region-beginning)
                                   (region-end)
                                   t)
        (haskell-sort-imports-at
         (save-excursion (haskell-goto-modules-start/end
                          'previous-line)
                         (point))
         (save-excursion (haskell-goto-modules-start/end
                          'next-line)
                         (point))
         nil)))))

(defun haskell-sort-imports-at (begin end region)
  (save-excursion
    (sort-regexp-fields nil
                        haskell-sort-imports-regexp
                        "\\4"
                        begin end))
  (when (not region)
    (let ((line (save-excursion (goto-char end)
                                (search-backward current-line))))
      (goto-char (+ line col)))))

(defun haskell-sort-imports-line-match ()
  "Try to match the current line as a regexp."
  (let ((line (buffer-substring-no-properties (line-beginning-position)
                                              (line-end-position))))
    (if (string-match "^import " line)
        line
      nil)))

(defun haskell-goto-modules-start/end (direction)
  "Skip a bunch of consequtive import lines up/down."
  (while (not (or (equal (point)
                         (point-max))
                  (not (haskell-sort-imports-line-match))))
    (funcall direction)))

(provide 'haskell-sort-imports)