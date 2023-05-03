(use-package neotree
  :ensure t
  :config
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(add-hook 'neo-after-create-hook (lambda (&rest _) (display-line-numbers-mode -1))))
(setq neo-smart-open t)
