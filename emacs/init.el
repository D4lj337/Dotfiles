;Author: kazuya

(defalias 'yes-or-no-p 'y-or-n-p)
(setq
make-backup-files nil
auto-save-default t ;; autosave
confirm-kill-emacs 'y-or-n-p ; confirm before exiting emacs
)

(defalias 'yes-or-no-p 'y-or-n-p) (add-hook 'prog-mode-hook 'display-line-numbers-mode) ;; Only use line-numbers in major modes
(add-hook 'text-mode-hook 'display-line-numbers-mode)
(show-paren-mode 1) ;; Show parent parentheses
(setq x-select-enable-clipboard t) ;; Copy and Paste outside of Emacs
;; Keybindings
(windmove-default-keybindings)

;; Display line numbers
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

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

;; Initialize use-package on non-Linux platform
(unless (package-installed-p 'use-package)
(package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Auto update and remove old packages
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; Enable ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-expert t)

;; Evil mode
(use-package evil
  :after dashboard
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
  :defer 0
  :ensure t)
(which-key-mode)

;; Async in emacs
(use-package async
  :ensure t
  :init (dired-async-mode 1))

;; Modeline
(use-package doom-modeline
  :after all-the-icons
  :init (doom-modeline-mode)
  :custom
  ;; Don't compact font caches during GC. Windows Laggy Issue
  (inhibit-compacting-font-caches t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-icon (display-graphic-p))
  (doom-modeline-checker-simple-format t)
  (doom-line-numbers-style 'relative)
  (doom-modeline-buffer-file-name-style 'relative-to-project)
  (doom-modeline-buffer-modification-icon t)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-buffer-state-icon t)
  (doom-modeline-flycheck-icon t)
  (doom-modeline-height 35))
;; (set-face-background 'mode-line nil)

;; icons
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :ensure t
  :init (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package all-the-icons-ibuffer
  :ensure t
  :init (all-the-icons-ibuffer-mode 1))

;; Solve slow icon rendering
(setq inhibit-compacting-font-caches t)

;; Make sure to M-x "all-the-icons-install-fonts" for proper icons and Keybindings

;; fonts
(use-package general
  :ensure t
  :config
  (general-evil-setup t))

;; Search
(use-package swiper
  :defer t
  :ensure t
  :bind ("C-s" . 'swiper))

;; Projectile
(use-package projectile
  :defer t
  :ensure t
  :init
  (projectile-mode 1))

;; Better search
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ido-vertical-mode
  :defer t
  :ensure t
  :init
  (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(use-package smex
  :defer t
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-solarized-dark-high-contrast t)

  ;; Enable flashing mode-line on errors
;;  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))


;;(set-frame-font "Comic Code Ligatures Medium 11" nil t)

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font Mono" :height 110 :weight 'light)
(set-face-attribute 'fixed-pitch nil :font "JetBrainsMono Nerd Font Mono" :height 110 :weight 'light)
(set-face-attribute 'variable-pitch nil :font "Iosevka Aile" :height 170 :weight 'light)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:font "Iosevka Aile" :italic t :height 1.0)))))

; Pywal support for emacs
;(use-package ewal
;  :defer t
;  :init (setq ewal-use-built-in-always-p nil
;	      ewal-use-built-in-on-failure-p t
;	      ewal-built-in-palette "sexy-material"))
;(use-package ewal-spacemacs-themes
;	     :init (progn
;          (setq spacemacs-theme-underline-parens t
;		my:rice:font (font-spec
;			         :family "Comic Code Ligatures Medium"
;                                 :size 11.0))
;          (show-paren-mode +1)
;          (global-hl-line-mode)
;          (set-frame-font my:rice:font nil t)
;          (add-to-list  'default-frame-alist
;                        `(font . ,(font-xlfd-name my:rice:font))))
;  :config (progn
;            (load-theme 'ewal-spacemacs-modern t)
;            (enable-theme 'ewal-spacemacs-modern)))
;(use-package ewal-evil-cursors
;  :after (ewal-spacemacs-themes)
;  :config (ewal-evil-cursors-get-colors))

;; github.com/doomemacs/doomemacs/blob/develop/core/core.el#L296
(use-package gcmh
  :init (gcmh-mode 1)
  :config
  (setq
   gcmh-idle-delay 'auto ; default is 15s
   gcmh-auto-idle-delay-factor 10
   gcmh-high-cons-threshold (* 16 1024 1024)) ; 16mb
  :delight " Ⓖ")

;; Vterm
(use-package vterm
  :ensure t
  :command (vterm)
  (global-set-key (kbd "C-x C-t") 'vterm))

(use-package org
  :commands (org-capture org-agenda))

;; Org bullets
(use-package org-bullets
  :after org
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Dashboard
(use-package dashboard
  :after all-the-icons
  :ensure t
  :init
  :custom
(dashboard-startup-banner 'logo)
(dashboard-set-file-icons t)
(dashboard-set-navigator t)
(dashboard-set-heading-icons t)
(dashboard-set-init-info t)
(dashboard-center-content t)
(dashboard-banner-logo-title "w3lc0m3 70 h3ll")
(dashboard-items nil)
;;(dashboard-items '((bookmarks . 5)
;;			(projects . 5)
;;			(recents . 5)))

(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  :config
  (dashboard-setup-startup-hook))
(setq dashboard-navigator-buttons
        `(;; line1
          ;; Keybindings
          ((,(all-the-icons-octicon "search" :height 0.9 :v-adjust -0.1)
            " Find file" nil
            (lambda (&rest _) (ido-find-file)) nil "" "            C-x C-f"))
          ((,(all-the-icons-octicon "file-directory" :height 1.0 :v-adjust -0.1)
            " Open project" nil
            (lambda (&rest _) (project-find-dir)) nil "" "         C-x p d"))
          ((,(all-the-icons-octicon "three-bars" :height 1.1 :v-adjust -0.1)
            " File explorer" nil
            (lambda (&rest _) (project-dired)) nil "" "        C-x p D"))))

;; C and C++ 
(use-package company-c-headers
  :defer nil
  :ensure t)

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

;; Lua
(use-package lua-mode
  :ensure t
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "30b14930bec4ada72f48417158155bc38dd35451e0f75b900febd355cda75c3e" "b66970f42d765a40fdb2b6b86dd2ab6289bed518cf4d8973919e5f24f0ca537b" "3a2e0c5597f6d74d99daa2b5bbbc2a653d02d6b88fcd73d3c84ebf25cde37b3f" "ba72dfc6bb260a9d8609136b9166e04ad0292b9760a3e2431cf0cd0679f83c3a" "ef2b2346702e5cbfd7eeaa699ba58528477fe48af333e6ffdafb864a2f30a505" "41098e2f8fa67dc51bbe89cce4fb7109f53a164e3a92356964c72f76d068587e" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default))
 '(package-selected-packages
   '(evwal-doom-themes cyberpunk-theme gotham-theme catppuccin-theme edit-indirect ## dashboard all-the-icons-ibuffer all-the-icons-dired async company-irony which-key vterm use-package smex projectile ido-vertical-mode general gcmh evil doom-modeline auto-package-update all-the-icons))
 '(warning-suppress-types '((use-package))))

