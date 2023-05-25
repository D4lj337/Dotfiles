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
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c C-b") 'nyan-mode)
