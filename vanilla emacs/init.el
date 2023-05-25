;; Create gcmh custom.el, required for startup.
(make-directory (expand-file-name "gcmh" user-emacs-directory) t)
(make-empty-file (expand-file-name "custom.el" user-emacs-directory) t)

(when (fboundp 'native-compile-async)
  (setq comp-deferred-compilation t
        comp-deferred-compilation-black-list '("/mu4e.*\\.el$")))

;; use-package---------------------------------------------------------------------------------------

;; Initialize package sources
(require'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                        ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
(package-refresh-contents))

;; Native compile external packages
(setq package-native-compile t)

;; Initialize use-package on non-Linux platform
(unless (package-installed-p 'use-package)
(package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; --------------------------------------------------------------------------------------------------
; Background color
(custom-set-faces '(default ((t (:background "black")))))

;; Catppuccin theme
;(setq doom-theme 'catppuccin)
;(load-theme 'catppuccin t t)
;(setq catppuccin-flavor 'mocha) ;; or 'latte, 'macchiato, or 'mocha
;(catppuccin-reload)
;(catppuccin-set-color 'base "#000000")
;(catppuccin-set-color 'mantle "#000000")
;(catppuccin-set-color 'crust "#000000" 'mocha)
;(catppuccin-reload)

; Mode line color
(custom-set-faces
'(mode-line ((t (:background "black")))))
;'(font-lock-comment-face ((t (:foreground ,(doom-color 'base6)))))

; Font
(set-face-attribute 'default nil :font "JetBrainsMono NFM" :height 109 :weight 'medium)
(set-face-attribute 'fixed-pitch nil :font "JetBrainsMono NFM" :height 100 :weight 'medium)
(set-face-attribute 'variable-pitch nil :font "UbuntuMono Nerd Font" :height 120 :weight 'medium)

(dolist (file '("config/config.el"
                "config/cc.el"
                "config/gdb.el"
                "config/keybindings.el"
                "config/bionic-reading.el"
                "config/async.el"
                "config/auto-update.el"
                "config/cc.el"
                "config/evil.el"
                "config/general.el"
                "config/icons.el"
                "config/dashboard.el"
                "config/ido.el"
                "config/irony.el"
                "config/neotree.el"
                "config/org.el"
                "config/projectile.el"
                "config/ewal.el"
                "config/smex.el"
                "config/swiper.el"
                "config/themes.el"
                "config/vterm.el"
                "config/which-key.el"
            		"config/nyan-mode.el"
		;; Modeline
		"config/doom-modeline.el"
		"config/vim-like-modeline.el"
                ;; IDE
		"config/company.el"
		"config/lsp-mode.el"
		"config/yasnippet.el"
		"config/magit.el"
	;	"config/treemacs.el"
          	      ))
  (load (expand-file-name file user-emacs-directory)))

; defer config
(use-package which-key                                    :defer t)
(use-package swiper                                       :defer t)
(use-package projectile                                   :defer t)
(use-package smex                                         :defer t)
(use-package auto-package-update                          :defer t)
(use-package org                                          :defer t)
(use-package company                                      :defer t)
(use-package lsp-mode                                     :defer t)
(use-package lsp-ui                                       :defer t)
(use-package yasnippet                                    :defer t)

; Disabled packages
(use-package magit                                        :disabled t)
(use-package treemacs                                     :disabled t)
(use-package neotree                                      :disabled t)
(use-package general                                      :disabled t)
(use-package company-c-headers                            :disabled t)
(use-package company-irony                                :disabled t)
(use-package irony                                        :disabled t)
(use-package doom-modeline                                :disabled t)

; github.com/doomemacs/doomemacs/blob/develop/core/core.el#L296
(use-package gcmh
  :init (gcmh-mode 1)
  :config
  (setq
   gcmh-idle-delay 'auto ; default is 15s
   gcmh-auto-idle-delay-factor 10
   gcmh-high-cons-threshold (* 16 1024 1024)) ; 16mb
  :delight " Ⓖ")
