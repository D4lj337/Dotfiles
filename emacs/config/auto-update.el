;; Auto update and remove old packages
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t
	auto-package-update-interval 4)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))
