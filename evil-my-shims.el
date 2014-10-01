(defgroup evil-my-shims nil
  "Shims for greater VIM-style invocation of Emacs features."
  :prefix "evil-my-shims-"
  :group 'evil)

(defcustom evil-my-shims-alternate-file t
  "Provide :A to find the alternate file like A.vim"
  :type 'boolean
  :group 'evil-my-shims)

(defcustom evil-my-shims-shell t
  "Provide a full-featured shell like :shell."
  :group 'evil-my-shims)

(when evil-my-shims-alternate-file
  (defun evil-shim-alternate-file ()
	"Find the alternate file like A.vim"
	(interactive)
	(require 'find-file)
	(let ((ff-case-fold-search t)
		  (ff-ignore-include t))
	  (ff-find-other-file)))
  (evil-ex-define-cmd "A" 'evil-shim-alternate-file))

(when evil-my-shims-shell
  (defun evil-shim-shell ()
	"Start a full-featured shell."
	(interactive)
	(let ((shell-cmd (or explicit-shell-file-name
						 (getenv "ESHELL")
						 (getenv "SHELL")
						 "/bin/sh")))
	  (term shell-cmd)))
  (evil-ex-define-cmd "sh[ell]" 'evil-shim-shell))


(provide 'evil-my-shims)
