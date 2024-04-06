;; Modeline
(use-package doom-modeline
  :after all-the-icons
  :init (doom-modeline-mode)
  :custom
 ;; Don't compact font caches during GC. Windows Laggy Issue
  (inhibit-compacting-font-caches t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-icon (display-graphic-p))
  (doom-modeline-checker-simple-format t)
  (doom-line-numbers-style 'relative)
  (doom-modeline-buffer-file-name-style 'relative-to-project)
  (doom-modeline-buffer-modification-icon t)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-buffer-state-icon t)
  (doom-modeline-flycheck-icon t)
  (doom-modeline-height 25)
  (doom-modeline-bar-width 4)
  (doom-modeline-window-width-limit 85)
  (doom-modeline-project-detection 'auto)
  (doom-modeline-minor-modes))
