(defalias 'yes-or-no-p 'y-or-n-p) ; yes or no to y or n
(setq
make-backup-files nil
auto-save-default t ;; autosave
confirm-kill-emacs 'y-or-n-p ; confirm before exiting emacs
enable-local-variables :safe ; host security
custom-file (expand-file-name "custom.el" user-emacs-directory) ; clean init.el file
global-display-line-number-mode 1
display-line-numbers-type 'relative
)
(load custom-file) 
(add-hook 'prog-mode-hook 'display-line-numbers-mode) ; Only use line-numbers in major modes
(add-hook 'text-mode-hook 'display-line-numbers-mode)
(show-paren-mode 1) ;; Show parent parentheses
(setq select-enable-clipboard t) ;; Copy and Paste outside of Emacs
(windmove-default-keybindings)

; Solve slow icon rendering
(setq inhibit-compacting-font-caches t)

;; Better search
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Enable ibuffer
(setq ibuffer-expert t)

;(kill-buffer "*messages*")
(kill-buffer "*scratch*")
(kill-buffer "*Messages*")
