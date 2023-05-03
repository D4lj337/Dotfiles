;; https://github.com/hlissner/doom-emacs/blob/58af4aef56469f3f495129b4e7d947553f420fca/core/core.el#L200
(unless (daemonp)
  (advice-add #'display-startup-echo-area-message :override #'ignore))

;; Disable menu and scrollbars
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode -1)
(global-tab-line-mode t)
(global-visual-line-mode t) ; don't let the text to go horizontal

(setq
 package-enable-at-startup nil ; don't auto-initialize!
 package-enable-imenu-support t  
 package--init-file-ensured t ; don't add that `custom-set-variables' block to init
 package-quickstart nil ; prevent `package.el' loading packages prior to their init-file
 package-archives nil)

(setq gc-cons-threshold (expt 2 32)) ; you can remove it

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
      gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 16777216 ; 16mb
                  gc-cons-percentage 0.1)))

(setq safe-local-variable-values
      '((org-src-preserve-indentation . t)
        (eval add-hook 'after-save-hook
              '(lambda nil
                 (org-babel-tangle))
              nil t)))

(setq
 tab-line-new-button-show nil
 tab-line-close-button-show nil
 tab-line-separator " "
 line-move-visual nil
 site-run-file nil ; unset SRF
 use-file-dialog nil
 mode-line-format nil ; don't want a mode line while loading init
 load-prefer-newer nil
 create-lockfiles nil ; disable lockfiles
 make-backup-files nil ; disable backup files
 auto-save-list-file-prefix nil ; disable auto-save
 auto-mode-case-fold nil ; use case-sensitive `auto-mode-alist' for performance
 default-input-method nil
 utf-translate-cjk-mode nil ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
 initial-scratch-message nil ; empty the initial *scratch* buffer.
 command-line-x-option-alist nil ; remove irreleant command line options for faster startup
 use-short-answers t ; y/n for yes/no
 vc-follow-symlinks t ; Do not ask about symlink following
 use-dialog-box nil
 inhibit-default-init t
 use-file-dialog nil
 redisplay-dont-pause t ; improve display engine
 inhibit-splash-screen t
 inhibit-startup-screen t 		; do not show the startup message
 inhibit-startup-message t      ; reduce noise at startup
 inhibit-startup-buffer-menu t  ; stop `list-buffers' from showing when opening multiple files
 fast-but-imprecise-scrolling t ; more performant rapid scrolling over unfontified regions
 frame-inhibit-implied-resize t ; do not resize the frame at this early stage
 ffap-machine-p-known 'reject   ; don't ping things that look like domain names
 inhibit-compacting-font-caches t ; Inhibit frame resizing for performance
 read-process-output-max (* 1024 1024) ; Increase how much is read from processes in a single chunk.
 redisplay-skip-fontification-on-input t ; Inhibits it for better scrolling performance.
 idle-update-delay 1.0 ; slow down UI updates down
 select-active-regions 'only ; Emacs hangs when large selections contain mixed line endings
 ad-redefinition-action 'accept ; disable warnings from legacy advice system
 initial-major-mode 'fundamental-mode
 inhibit-startup-echo-area-message user-login-name)

;; Prevent unwanted runtime builds; packages are compiled ahead-of-time when
;; they are installed and site files are compiled when gccemacs is installed.
;; (setq comp-deferred-compilation nil)
(setq native-comp-deferred-compilation nil)
;; Suppress warnings and errors during asynchronous native compilation
(setq native-comp-async-report-warnings-errors nil)

;; Prevent unwanted runtime builds in gccemacs (native-comp); packages are
;; compiled ahead-of-time when they are installed and site files are compiled
;; when gccemacs is installed.
(setq comp-deferred-compilation nil)
