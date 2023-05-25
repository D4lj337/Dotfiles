:nyancat
(use-package nyan-mode
  :init (nyan-mode)
  :custom
  (nyan-animate-nyancat t)
  (autoload 'nyan-mode "nyan-mode" "Nyan Mode" t)
  (nyan-bar-length 12)
  (nyan-wavy-trail t)
  :bind
  ("C-c C-b" . nyan-mode))
