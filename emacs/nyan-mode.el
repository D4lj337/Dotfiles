:nyancat
(use-package nyan-mode
  :init (nyan-mode)
  :custom
  (nyan-animate-nyancat t)
  (autoload 'nyan-mode "nyan-mode" "Nyan Mode" t)
  (nyan-bar-length 22)
  (nyan-animation-frame-interval )
  (nyan-minimum-window-width 8)
  (nyan-wavy-trail t)
  (nyan-cat-face-number 3))
