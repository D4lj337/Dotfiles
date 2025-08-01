(defun my/protect-vital-buffers ()
  "Prevent killing vital buffers."
  (not (member (buffer-name) '("*Welcome-screen*"))))
(message "I'm Immortal")
(add-hook 'kill-buffer-query-functions #'my/protect-vital-buffers)

(defun my/toggle-mode-line ()
"Toggles the modeline on and off."
  (interactive) 
  (setq mode-line-format
    (if (equal mode-line-format nil)
    (default-value 'mode-line-format)) )
  (redraw-display))
(global-set-key [M-f12] 'toggle-mode-line)

(defun my/visit-init ()
  "Open the Emacs init file."
  (interactive)
  (message "Opening Emacs Init")
  (find-file (expand-file-name "config.org" user-emacs-directory)))

(defun my/visit-qtile ()
  "Open the qtile cofnig file."
  (interactive)
  (message "Opening Qtile Configuration")
  (find-file "~/.config/qtile/config.py"))

(defun my/highlight-word ()
  "Highlight the current word you are on."
  (interactive)
  (message "Highlighting word")
  (backward-word 1)
  (set-mark-command nil)
  (forward-word 1))

(defun my/kill-all-buffers ()
  "Kill all the buffers."
  (interactive)
  (message "Killed all buffers")
  (mapc 'kill-buffer (buffer-list)))

(defun my/split-and-follow-horizontally ()
  "Split horziontally and follow."
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))

(defun my/split-and-follow-vertically ()
  "Split vertically and follow."
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))

(defun my/kill-whole-word ()
  "kill the whole word."
  (interactive)
  (message "Killed whole word")
  (backward-word)
  (kill-word 1))

(defun my/copy-whole-line ()
  "Copy whole line."
  (interactive)
  (message "Copied whole line")
  (save-excursion
    (kill-new
     (buffer-substring
  (pos-bol)
  (pos-eol)))))

(provide 'feature)
