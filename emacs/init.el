;Author: kazuya

(defalias 'yes-or-no-p 'y-or-n-p) ; yes or no to y or n
(setq
make-backup-files nil
auto-save-default t ;; autosave
confirm-kill-emacs 'y-or-n-p ; confirm before exiting emacs
enable-local-variables :safe ; host security
custom-file "~/.config/emacs/custom.el" ; clean init.el file
ido-vertical-define-keys 'C-n-and-C-p-only
)
(load custom-file) 
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ; Only use line-numbers in major modes
(add-hook 'text-mode-hook 'display-line-numbers-mode)
(show-paren-mode 1) ;; Show parent parentheses
(setq x-select-enable-clipboard t) ;; Copy and Paste outside of Emacs
(windmove-default-keybindings)

; Visit the config
(defun visit-init ()
  (interactive)
  (find-file "~/.config/emacs/init.el"))

; visit the qtile config
(defun visit-qtile ()
  (interactive)
  (find-file "~/.config/qtile/config.py"))

; Reload config
(defun config-reload()
  (interactive)
  (load-file "~/.config/emacs/init.el"))

;; Keybindings
(global-set-key (kbd "C-c e") 'visit-init) ; vist the config
(global-set-key (kbd "C-c q") 'visit-qtile) ; vist the qtile config
(global-set-key (kbd "C-c r") 'config-reload) ; reload the config
(global-set-key (kbd "C-x C-b") 'ibuffer)    ; ibuffer
(global-set-key (kbd "C-c T") 'vterm)      ; vterm
(global-set-key (kbd "C-c t") 'vterm-toggle-cd) ; vterm-toggle to cd
(global-set-key (kbd "C-c b") 'infu-bionic-reading-buffer) ; bionic reading
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-decrease)
(global-set-key (kbd "C-c n") 'neotree-toggle)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'smex)

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

;; Auto update and remove old packages
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t
	auto-package-update-interval 4)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; Enable ibuffer
(setq ibuffer-expert t)

;; Evil mode
(use-package evil
  :after dashboard
  :ensure t)
(require 'evil)
(evil-mode 1)

;; Which key
(use-package which-key
  :defer 0
  :ensure t)
(which-key-mode)

;; Async in emacs
(use-package async
  :ensure t
  :init (dired-async-mode 1))
(async-bytecomp-package-mode 1)

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
  (set-face-background 'mode-line nil)

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

; Solve slow icon rendering
(setq inhibit-compacting-font-caches t)

;; Make sure to M-x "all-the-icons-install-fonts" for proper icons and Keybindings

;; fonts
(use-package general
  :ensure t
  :config
  (general-evil-setup t))

; Search
(use-package swiper
  :defer t
  :ensure t)

; Projectile
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

(use-package smex
  :defer t
  :ensure t
  :init (smex-initialize))

;(use-package doom-themes
;  :ensure 
;  :config
  ;; Global settings (defaults)
;  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;        doom-themes-enable-italic t) ; if nil, italics is universally disabled
;  (load-theme 'catppuccin t)
;  ;; Enable flashing mode-line on errors
;;  (doom-themes-visual-bell-config)
;  ;; Enable custom neotree theme (all-the-icons must be installed!)
;  (doom-themes-neotree-config)
;  ;; or for treemacs users
;  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
;  (doom-themes-treemacs-config)
;  ;; Corrects (and improves) org-mode's native fontification.
;  (doom-themes-org-config))

;Catppuccin theme
(load-theme 'catppuccin t)
(setq catppuccin-flavour 'mocha)
(catppuccin-set-color 'base "#000000")
(catppuccin-set-color 'mantle "#010101")
(catppuccin-set-color 'crust "#020202")
(catppuccin-reload)

; Font
(set-face-attribute 'default nil :font "JetBrains Mono Nerd Font" :height 110 :weight 'medium)
(set-face-attribute 'fixed-pitch nil :font "JetBrains Mono Nerd Font" :height 100 :weight 'medium)
(set-face-attribute 'variable-pitch nil :font "Ubuntu Nerd Font" :height 120 :weight 'medium)

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

; github.com/doomemacs/doomemacs/blob/develop/core/core.el#L296
(use-package gcmh
  :init (gcmh-mode 1)
  :config
  (setq
   gcmh-idle-delay 'auto ; default is 15s
   gcmh-auto-idle-delay-factor 10
   gcmh-high-cons-threshold (* 16 1024 1024)) ; 16mb
  :delight " Ⓖ")

;; Vterm & vterm-toggle
(use-package vterm
  :ensure t)
(use-package vterm-toggle
  :ensure t)

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
(dashboard-banner-logo-title "Welcome to Dark Side")
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

(setq-default c-basic-offset 4) ; gnu style indenting of c
(setq c-default-style "linux"
      c-basic-offset 4)
(electric-pair-mode 1) ; electric pair mode

(use-package irony
  :defer nil
  :ensure t
  :config
  :hook
  ((c++-mode c-mode) . irony-mode)
  ('irony-mode-hook) . 'irony-cdb-autosetup-compile-options)

; Lua
(use-package lua-mode
  :ensure t
  )

(use-package neotree
  :ensure t
  :config
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(add-hook 'neo-after-create-hook (lambda (&rest _) (display-line-numbers-mode -1))))
(setq neo-smart-open t)

; Bionic Reading
(defvar infu-bionic-reading-face nil "a face for `infu-bionic-reading-region'.")

(setq infu-bionic-reading-face 'bold)
;; try
;; 'bold
;; 'error
;; 'warning
;; 'highlight
;; or any value of M-x list-faces-display

(defun infu-bionic-reading-buffer ()
  "Bold the first few chars of every word in current buffer.
Version 2022-05-21"
  (interactive)
  (infu-bionic-reading-region (point-min) (point-max)))

(defun infu-bionic-reading-region (Begin End)
  "Bold the first few chars of every word in region.
Version 2022-05-21"
  (interactive "r")
  (let (xBounds xWordBegin xWordEnd  )
    (save-restriction
      (narrow-to-region Begin End)
      (goto-char (point-min))
      (while (forward-word)
        ;; bold the first half of the word to the left of cursor
        (setq xBounds (bounds-of-thing-at-point 'word))
        (setq xWordBegin (car xBounds))
        (setq xWordEnd (cdr xBounds))
        (setq xBoldEndPos (+ xWordBegin (1+ (/ (- xWordEnd xWordBegin) 2))))
        (put-text-property xWordBegin xBoldEndPos
                           'font-lock-face infu-bionic-reading-face)))))

