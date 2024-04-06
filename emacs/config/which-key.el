;; Which key
(use-package which-key
  :ensure t
  :custom
  (which-key-lighter "")
;  (which-key-sort-order #'which-key-order-alpha)
  (which-key-sort-uppercase-first nil)
  (which-key-add-column-padding 1)
  (which-key-max-display-columns nil)
  (which-key-min-display-lines 6)
  (which-key-compute-remaps t)
  (which-key-side-window-slot -10)
  (which-key-separator " -> ")
  (which-key-allow-evil-operators t)
  (which-key-use-C-h-commands t)
  (which-key-show-remaining-keys t)
  (which-key-show-prefix 'bottom)
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom)
  (which-key-setup-minibuffer))
