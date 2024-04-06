;--------------------------------------------------------------------------------------------------

;; native comp speed

(setq native-comp-speed 3) ;; maximum native Elisp speed!
;(native-compile-async "/usr/local/bin/emacs" 'recursively)

;;-------------------------------------------------------------------------------------------------

;; Create gcmh custom.el, required for startup.
(make-directory (expand-file-name "gcmh" user-emacs-directory) t)
(make-empty-file (expand-file-name "custom.el" user-emacs-directory) t)

(when (fboundp 'native-compile-async)
  (setq comp-deferred-compilation t
        comp-deferred-compilation-black-list '("/mu4e.*\\.el$")))

;;--------------------------------------------------------------------------------------------------

;; Byte compilation on package update:
(defun byte-compile-emacs-directory ()
  "Byte-compile all .el files in the Emacs directory."
  (interactive)
  (let ((emacs-dir (expand-file-name user-emacs-directory)))
    (dolist (file (directory-files-recursively emacs-dir "\\.el$"))
      (byte-compile-file file))))

;; Set a weekly timer to run the function
(run-with-idle-timer (* 7 24 60 60) t #'byte-compile-emacs-directory)

;;--------------------------------------------------------------------------------------------------

;; use-package (use-package is inbuilt from Emacs 28)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                        ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
(package-refresh-contents))

;; Native compile external packages
(setq package-native-compile t)

;; --------------------------------------------------------------------------------------------------

;; Background color

(custom-set-faces '(default ((t (:background "black")))))
(custom-set-faces '(default ((t (:forground "#0adad5")))))

;; Theme for doom emacs

;; Catppuccin theme
;(setq doom-theme 'catppuccin)
;(load-theme 'catppuccin t t)
;(setq catppuccin-flavor 'mocha) ;; or 'latte, 'macchiato, or 'mocha
;(catppuccin-reload)
;(catppuccin-set-color 'base "#000000")
;(catppuccin-set-color 'mantle "#000000")
;(catppuccin-set-color 'crust "#000000" 'mocha)
;(catppuccin-reload)


;; --------------------------------------------------------------------------------------------------

;; Mode line color

(custom-set-faces
 '(mode-line ((t (:background "#0abab5"
			      :foreground "#000000")))))
 '(font-lock-comment-face ((t (:foreground ,(doom-color "#000000")))))


;; --------------------------------------------------------------------------------------------------

;; Font
(set-face-attribute 'default nil :font "JetBrainsMono NFM" :height 109 :weight 'medium)
(set-face-attribute 'fixed-pitch nil :font "JetBrainsMono NFM" :height 100 :weight 'medium)
(set-face-attribute 'variable-pitch nil :font "UbuntuMono Nerd Font" :height 120 :weight 'medium)

(dolist (file '("config/config.el" ; Required file
		"config/functions.el" ; Required file
                "config/cc.el"
                "config/keybindings.el"
                "config/bionic-reading.el"
;		"config/async.el"
		"config/auto-update.el"
                "config/cc.el"
                "config/general.el"
                "config/icons.el"
                "config/dashboard.el"
                "config/ido.el"
                "config/irony.el"
                "config/neotree.el"
		"config/centaur-tabs.el"
;                "config/org.el"
;		"config/projectile.el"
;                "config/smex.el"
                "config/swiper.el"
                "config/themes.el"
                "config/vterm.el"
                "config/which-key.el"
      		"config/nyan-mode.el"
;               "config/ewal.el"

		;; Compiler
                "config/gdb.el"

		;; menu 
		"config/vertico.el"

		;; Modeline
;		"config/doom-modeline.el"
;		"config/vim-like-modeline.el"

                ;; IDE
;		"config/company.el"
;		"config/lsp-mode.el"
;		"config/yasnippet.el"
;		"config/magit.el"
;		"config/treemacs.el"

		;; switch buffer
		"config/switch-buffer-functions.el"

		;; Mode
;		"config/god-mode.el"
                "config/evil.el"

		"config/man.el"

		"config/dmenu.el"

		"config/beacon.el"
          	      ))
  (load (expand-file-name file user-emacs-directory)))

;; --------------------------------------------------------------------------------------------------

;; defer packages
(use-package which-key                                    :defer t)
(use-package swiper                                       :defer t)
(use-package projectile                                   :defer t)
(use-package auto-package-update                          :defer t)
(use-package org                                          :defer t)
(use-package company                                      :defer t)
(use-package lsp-mode                                     :defer t)
(use-package lsp-ui                                       :defer t)
(use-package yasnippet                                    :defer t)
(use-package centaur-tabs                                 :defer t)
(use-package vertico                                      :defer t)

; Disabled packages
(use-package smex                                         :disabled t)
(use-package god-mode                                     :disabled t)
(use-package magit                                        :disabled t)
(use-package treemacs                                     :disabled t)
(use-package neotree                                      :disabled t)
(use-package general                                      :disabled t)
(use-package company-c-headers                            :disabled t)
(use-package company-irony                                :disabled t)
(use-package irony                                        :disabled t)
(use-package doom-modeline                                :disabled t)
(use-package async                                        :disabled t)

; github.com/doomemacs/doomemacs/blob/develop/core/core.el#L296
(use-package gcmh
  :init (gcmh-mode 1)
  :config
  (setq
   gcmh-idle-delay 'auto ; default is 15s
   gcmh-auto-idle-delay-factor 10
   gcmh-high-cons-threshold (* 16 1024 1024)) ; 16mb
  :delight " Ⓖ")
