;; Dashboard
(use-package dashboard
  :after all-the-icons
  :ensure t
  :init
  :custom
(dashboard-startup-banner 'logo)
(dashboard-set-file-icons t)
(dashboard-set-navigator t)
(dashboard-set-heading-icons t)
(dashboard-set-init-info t)
(dashboard-center-content t)
(dashboard-banner-logo-title "Welcome to Dark Side")
(dashboard-items nil)
;;(dashboard-items '((bookmarks . 5)
;;			(projects . 5)
;;			(recents . 5)))

(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  :config
  (dashboard-setup-startup-hook))
(setq dashboard-navigator-buttons
        `(;; line1
          ;; Keybindings
          ((,(all-the-icons-octicon "search" :height 0.9 :v-adjust -0.1)
            " Find file" nil
            (lambda (&rest _) (ido-find-file)) nil "" "            C-x C-f"))
          ((,(all-the-icons-octicon "file-directory" :height 1.0 :v-adjust -0.1)
            " Open project" nil
            (lambda (&rest _) (project-find-dir)) nil "" "         C-x p d"))
          ((,(all-the-icons-octicon "three-bars" :height 1.1 :v-adjust -0.1)
            " File explorer" nil
            (lambda (&rest _) (project-dired)) nil "" "        C-x p D"))))
