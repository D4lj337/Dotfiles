; Visit the config
(defun visit-init ()
  (interactive)
  (find-file (expand-file-name "init.el" user-emacs-directory)))

; visit the qtile config
(defun visit-qtile ()
  (interactive)
  (find-file "~/.config/qtile/config.py"))

;; Highlight the word
(defun hightlight-word ()
  "Highlight the current word you are on."
  (interactive)
  (backward-word 1)
  (set-mark-command nil)
  (forward-word 1))
