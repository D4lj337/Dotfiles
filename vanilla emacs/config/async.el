;; Async in emacs
(use-package async
  :ensure t
  :init (dired-async-mode 1))
(async-bytecomp-package-mode 'all)
