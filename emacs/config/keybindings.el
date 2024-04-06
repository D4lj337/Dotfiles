;; Keybindings

;; Visit the config
(global-set-key (kbd "C-c e") 'visit-init) ; vist the config
(global-set-key (kbd "C-c q") 'visit-qtile) ; vist the qtile config

;; Restart the Emacs
(global-set-key (kbd "C-c r") 'restart-emacs) ; restart the Emacs.

;; Buffers
(global-set-key (kbd "C-x b") 'buffer-menu)    ; ibuffer
(global-set-key (kbd "C-x C-k") 'kill-buffer)    ; kill buffer
;(global-set-key (kbd "C-x j") 'previous-buffer)    ; move to previous buffer
;(global-set-key (kbd "C-x k") 'next-buffer)    ; move to next buffer

;; Escape
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)    

;; File
(global-set-key (kbd "C-c f") 'find-name-dired)
(global-set-key (kbd "C-c s") 'find-lisp-find-dired)

;; Applications
(global-set-key (kbd "C-c p") 'dmenu) ; dmenu
(global-set-key (kbd "C-c T") 'vterm)      ; vterm
(global-set-key (kbd "C-c t") 'vterm-toggle-cd) ; vterm-toggle to cd

(global-set-key (kbd "C-x B") 'infu-bionic-reading-buffer) ; bionic reading
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-decrease)

(global-set-key (kbd "C-c n") 'neotree-toggle)

(global-set-key (kbd "C-s") 'swiper)

;(global-set-key (kbd "M-x") 'vertico)

(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(global-set-key (kbd "C-c c") 'compile)

(global-set-key (kbd "C-c C-b") 'nyan-mode)

(global-set-key (kbd "C-c C-u") 'package-upgrade-all)
