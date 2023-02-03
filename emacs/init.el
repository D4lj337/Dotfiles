;; Author: kazuya

;; Garbage collection
(add-to-list 'load-path "~/.config/emacs/gcmh")
(gcmh-mode 1)

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                   (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

;; Don't show the splash screen
(setq inhibit-startup-message t) 

;; Disable menu and scrollbars
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(scroll-bar-mode -1)

;; Interface
(setq use-dialog-box nil)
(setq use-file-dialog nil)
(global-subword-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-default t) ;; Autosave
(setq scroll-conservatively 100) ;; Better scrolling
(defalias 'yes-or-no-p 'y-or-n-p)
(global-hl-line-mode t)
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ;; Only use line-numbers in major modes
(add-hook 'text-mode-hook 'display-line-numbers-mode)
(show-paren-mode 1) ;; Show parent parentheses
(setq x-select-enable-clipboard t) ;; Copy and Paste outside of Emacs
;; Keybindings
(windmove-default-keybindings)

;; Display line numbers
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

;; font
;;(set-face-attribute 'default nil :font "Comic Code Ligatures Medium" :height 110)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                        ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
(package-refresh-contents))

;; Initialize use-package on non-Linux platform
(unless (package-installed-p 'use-package)
(package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Auto update and remove old packages
(use-package auto-package-update
  :defer nil
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; Evil mode
(use-package evil
  :defer t
  :ensure t)
(require 'evil)
(evil-mode 1)

;; Zooming in and out
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-decrease)

;; Which key
(use-package which-key
  :defer t
  :ensure t)
(which-key-mode)

;; Modeline
(use-package doom-modeline
  :ensure t
  :defer t
  :init (doom-modeline-mode 1))

;; icons
(use-package all-the-icons
  :defer t
  :if (display-graphic-p))

;; Keybindings
(use-package general
  :ensure t
  :config
  (general-evil-setup t))

;; Search
;;(use-package swiper
 ;; :ensure t
  ;;:bind ("C-s" . 'swiper))

;; Projectile
(use-package projectile
  :ensure t
  :init
  (projectile-mode 1))

;; Better search
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(use-package smex
  :ensure t
  :defer t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

;; Pywal support for emacs
(use-package ewal
  :defer t
  :init (setq ewal-use-built-in-always-p nil
	      ewal-use-built-in-on-failure-p t
	      ewal-built-in-palette "sexy-material"))
(use-package ewal-spacemacs-themes
	     :init (progn
          (setq spacemacs-theme-underline-parens t
		my:rice:font (font-spec
			         :family "Comic Code Ligatures Medium"
                                 :size 11.0))
          (show-paren-mode +1)
          (global-hl-line-mode)
          (set-frame-font my:rice:font nil t)
          (add-to-list  'default-frame-alist
                        `(font . ,(font-xlfd-name my:rice:font))))
  :config (progn
            (load-theme 'ewal-spacemacs-modern t)
            (enable-theme 'ewal-spacemacs-modern)))
(use-package ewal-evil-cursors
  :after (ewal-spacemacs-themes)
  :config (ewal-evil-cursors-get-colors))

(use-package gcmh
	:ensure t)

;; Vterm
(use-package vterm
  :defer t
  :ensure t)

;; Markdown
(use-package markdown-mode
  :ensure t
  :defer t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

;; C and C++ Support
(use-package company-irony
  :defer nil
  :ensure t
  :config
  (setq company-backends '((company-c-headers
                            company-dabbrev-code
                            company-irony))))
(use-package irony
  :defer nil
  :ensure t
  :config
  :hook
  ((c++-mode c-mode) . irony-mode)
  ('irony-mode-hook) . 'irony-cdb-autosetup-compile-options)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company-irony which-key vterm use-package smex projectile markdown-mode ido-vertical-mode general gcmh ewal-spacemacs-themes ewal-evil-cursors evil doom-modeline auto-package-update all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
