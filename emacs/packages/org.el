(use-package org
  :commands (org-capture org-agenda))

;; Org bullets
(use-package org-bullets
  :after org
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
