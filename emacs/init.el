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
; Custom background color
(custom-set-faces '(default ((t (:background "#000000")))))

; Font
(set-face-attribute 'default nil :font "JetBrains Mono Nerd Font" :height 110 :weight 'medium)
(set-face-attribute 'fixed-pitch nil :font "JetBrains Mono Nerd Font" :height 100 :weight 'medium)
(set-face-attribute 'variable-pitch nil :font "Ubuntu Nerd Font" :height 120 :weight 'medium)


; defer packages
(use-package neotree                                      :defer t)
(use-package which-key                                    :defer t)
(use-package swiper                                       :defer t)
(use-package projectile                                   :defer t)
(use-package smex                                         :defer t)
(use-package auto-package-update                          :defer t)
(use-package general                                      :defer t)
(use-package org                                          :defer t)
(use-package company-c-headers                            :defer t)
(use-package company-irony                                :defer t)
(use-package irony                                        :defer t)
(use-package god-mode                                        :defer t)

; github.com/doomemacs/doomemacs/blob/develop/core/core.el#L296
(use-package gcmh
  :init (gcmh-mode 1)
  :config
  (setq
   gcmh-idle-delay 'auto ; default is 15s
   gcmh-auto-idle-delay-factor 10
   gcmh-high-cons-threshold (* 16 1024 1024)) ; 16mb
  :delight " Ⓖ")

;; load modules

(load (expand-file-name "modules/config.el" user-emacs-directory))
(load (expand-file-name "modules/cc.el" user-emacs-directory))
(load (expand-file-name "modules/gdb.el" user-emacs-directory))
(load (expand-file-name "modules/keybindings.el" user-emacs-directory))
(load (expand-file-name "modules/bionic-reading.el" user-emacs-directory))

;; load packages
(load (expand-file-name "packages/async.el" user-emacs-directory))
(load (expand-file-name "packages/auto-update.el" user-emacs-directory))
(load (expand-file-name "packages/cc.el" user-emacs-directory))
(load (expand-file-name "packages/evil.el" user-emacs-directory))
(load (expand-file-name "packages/general.el" user-emacs-directory))
(load (expand-file-name "packages/icons.el" user-emacs-directory))
(load (expand-file-name "packages/dashboard.el" user-emacs-directory))
(load (expand-file-name "packages/ido.el" user-emacs-directory))
(load (expand-file-name "packages/irony.el" user-emacs-directory))
(load (expand-file-name "packages/modeline.el" user-emacs-directory))
(load (expand-file-name "packages/neotree.el" user-emacs-directory))
(load (expand-file-name "packages/org.el" user-emacs-directory))
(load (expand-file-name "packages/projectile.el" user-emacs-directory))
(load (expand-file-name "packages/ewal.el" user-emacs-directory))
(load (expand-file-name "packages/smex.el" user-emacs-directory))
(load (expand-file-name "packages/swiper.el" user-emacs-directory))
(load (expand-file-name "packages/themes.el" user-emacs-directory))
(load (expand-file-name "packages/vterm.el" user-emacs-directory))
(load (expand-file-name "packages/which-key.el" user-emacs-directory))
(load (expand-file-name "packages/god-mode.el" user-emacs-directory))
