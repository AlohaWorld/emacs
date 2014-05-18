;;; bog-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (bog-mode bog-search-citekey-on-web bog-create-combined-bib
;;;;;;  bog-clean-and-rename-staged-bibs bog-find-citekey-bib bog-rename-staged-file-to-citekey
;;;;;;  bog-find-citekey-file) "bog" "bog.el" (21346 19955 0 0))
;;; Generated autoloads from bog.el

(autoload 'bog-find-citekey-file "bog" "\
Open citekey-associated file.
If a prefix argument is given, a prompt will open to select from
available citekeys. Otherwise, the citekey will be taken from the
text under point if it matches `bog-citekey-format' or using
`bog-citekey-func'.

\(fn ARG)" t nil)

(autoload 'bog-rename-staged-file-to-citekey "bog" "\
Rename citekey file in `bog-stage-directory' with `bog-file-renaming-func'.
The citekey will be taken from the text under point if it matches
`bog-citekey-format' or using `bog-citekey-func'.

\(fn)" t nil)

(autoload 'bog-find-citekey-bib "bog" "\
Open BibTeX file for a citekey.
If a prefix argument is given, a prompt will open to select from
available citekeys. Otherwise, the citekey will be taken from the
text under point if it matches `bog-citekey-format' or using
`bog-citekey-func'.

\(fn ARG)" t nil)

(autoload 'bog-clean-and-rename-staged-bibs "bog" "\
Clean and rename BibTeX files in `bog-stage-directory'.

New BibTeX files are searched for in `bog-stage-directory', and
`bog-prepare-bib-file' will be run one each file before it is
moved to `bog-bib-directory'/<citekey>.bib.

This function is only useful if you use the non-standard setup of
one entry per BibTeX file.

\(fn)" t nil)

(autoload 'bog-create-combined-bib "bog" "\
Create buffer that has entries for all citekeys in buffer.

\(fn)" t nil)

(autoload 'bog-search-citekey-on-web "bog" "\
Open browser and perform query based for a citekey.

The URL will be taken from `bog-web-search-url'.

The citekey is split by groups in `bog-citekey-format' and joined by
\"+\" to form the query string.

\(fn)" t nil)

(autoload 'bog-mode "bog" "\
Toggle Bog in this buffer.
With a prefix argument ARG, enable `bog-mode' if ARG is positive,
and disable it otherwise. If called from Lisp, enable the mode if
ARG is omitted or nil.

\\{bog-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("bog-pkg.el") (21346 19956 6000 0))

;;;***

(provide 'bog-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; bog-autoloads.el ends here
