;; This file "init-cpp.el" is for C++ programming language

; I want to use in c++ mode
(c-add-style "my-style" 
			 '("gnu"
			   (indent-tabs-mode . nil)        ; use spaces rather than tabs
			   (c-basic-offset . 4)            ; indent by four spaces
			   (c-offsets-alist . ((inline-open . 0)  ; custom indentation rules
								   (brace-list-open . 0)
								   (statement-case-open . +)))))

(defun my-c++-mode-hook ()
  (c-set-style "my-style")        ; use my-style defined above
  (auto-fill-mode)         
  (c-toggle-auto-hungry-state 0))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
