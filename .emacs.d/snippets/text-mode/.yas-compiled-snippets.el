;;; Compiled snippets and support files for `text-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'text-mode
					 '(("email" "`(replace-regexp-in-string \"@\" \"@NOSPAM.\" user-mail-address)`" "(user's email)" nil nil nil nil nil nil)
					   ("myname" "`(replace-regexp-in-string \"^\" \"\" user-full-name)`\n" "(user's full name)" nil nil nil nil nil nil)
					   ("time" "`(current-time-string)`" "(current time)" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Mon Jan 27 14:11:56 2014
