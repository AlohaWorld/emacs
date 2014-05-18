;;; el-autoyas-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "el-autoyas" "el-autoyas.el" (20416 62146))
;;; Generated autoloads from el-autoyas.el

(add-hook 'emacs-lisp-mode-hook '(lambda nil (require 'el-autoyas nil t) (when (featurep 'el-autoyas) (set (make-local-variable 'yas/fallback-behavior) '(apply el-autoyas-expand-maybe)) (yas/minor-mode 1))))

;;;***

;;;### (autoloads nil nil ("el-autoyas-pkg.el") (20416 62146 369000))

;;;***

(provide 'el-autoyas-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; el-autoyas-autoloads.el ends here
