;;; pinyin-search-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (helm-pinyin-search isearch-backward-pinyin isearch-forward-pinyin
;;;;;;  isearch-toggle-pinyin) "pinyin-search" "pinyin-search.el"
;;;;;;  (21798 22923 0 0))
;;; Generated autoloads from pinyin-search.el

(autoload 'isearch-toggle-pinyin "pinyin-search" "\
Toggle pinyin in searching on or off.
Toggles the value of the variable `pinyin-search-activated'.

\(fn)" t nil)

(autoload 'isearch-forward-pinyin "pinyin-search" "\
Search Chinese forward by Pinyin.

\(fn)" t nil)

(autoload 'isearch-backward-pinyin "pinyin-search" "\
Search Chinese backward by Pinyin.

\(fn)" t nil)

(defalias 'pinyin-search 'isearch-forward-pinyin)

(defalias 'pinyin-search-backward 'isearch-backward-pinyin)

(define-key isearch-mode-map "\363p" #'isearch-toggle-pinyin)

(autoload 'helm-pinyin-search "pinyin-search" "\
Preconfigured helm for pinyin-search.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("pinyin-search-pkg.el") (21798 22923 325000
;;;;;;  0))

;;;***

(provide 'pinyin-search-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; pinyin-search-autoloads.el ends here
