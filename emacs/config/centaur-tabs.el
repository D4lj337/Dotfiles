;; centaur tabs
(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-style "wave")
  (setq centaur-tabs-set-bar 'under)
  (setq centaur-tabs-gray-out-icons 'buffer)
  (setq centaur-tabs-set-close-button nil)
  :hook
  (dired-mode . centaur-tabs-local-mode)
  :bind)

(defun centaur-tabs-hide-tab (x)
  "Do no to show buffer X in tabs."
  (let ((name (format "%s" x)))
	(or
	 ;; Current window is not dedicated window.
	 (window-dedicated-p (selected-window))

	 ;; Buffer name not match below blacklist.
	 (string-prefix-p "*epc" name)
	 (string-prefix-p "*helm" name)
	 (string-prefix-p "*Helm" name)
	 (string-prefix-p "*Compile-Log*" name)
	 (string-prefix-p "*lsp" name)
	 (string-prefix-p "*company" name)
	 (string-prefix-p "*Flycheck" name)
	 (string-prefix-p "*tramp" name)
	 (string-prefix-p " *Mini" name)
	 (string-prefix-p "*help" name)
	 (string-prefix-p "*straight" name)
	 (string-prefix-p " *temp" name)
	 (string-prefix-p "*Help" name)
	 (string-prefix-p "*mybuf" name)
	 (string-prefix-p "*scratch" name)
	 (string-prefix-p "*Messages" name)
	 (string-prefix-p "*Native-compile-log" name)
	 (string-prefix-p "*doom" name)

	 ;; Is not magit buffer.
	 (and (string-prefix-p "magit" name)
		  (not (file-name-extension name)))
	 )))

