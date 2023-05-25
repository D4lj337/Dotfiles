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
