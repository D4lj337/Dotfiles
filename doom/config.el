; $DOOMDIR/config.el -*- lexical-binding: t; -*-

'(server-mode t)
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

;(custom-set-faces '(default ((t (:background "#000000")))))

(set-face-attribute 'default nil :font "JetBrainsMono NFM" :height 110 :weight 'medium)
(set-face-attribute 'fixed-pitch nil :font "JetBrainsMono NFM" :height 100 :weight 'medium)
(set-face-attribute 'variable-pitch nil :font "UbuntuMono Nerd Font" :height 120 :weight 'medium)

;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;

;; Doom theme
;(setq doom-theme 'doom-ir-black)
;(custom-set-faces! '(default :background "black"))

;; Catppuccin theme
(setq doom-theme 'catppuccin)
(load-theme 'catppuccin t t)

(setq catppuccin-flavor 'mocha) ;; or 'latte, 'macchiato, or 'mocha
(catppuccin-reload)
(catppuccin-set-color 'base "#000000")
(catppuccin-set-color 'mantle "#000000")
(catppuccin-set-color 'crust "#000000" 'mocha)
(catppuccin-reload)

;; Must be used *after* the theme is loaded
(custom-set-faces
  `(mode-line ((t (:background ,(doom-color 'black)))))
 ; `(font-lock-comment-face ((t (:foreground ,(doom-color 'base6)))))
  )

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;nyancat
(use-package! nyan-mode
  :init (nyan-mode)
  :custom
  (nyan-animate-nyancat t)
  (autoload 'nyan-mode "nyan-mode" "Nyan Mode" t)
  (nyan-bar-length 12)
  (nyan-wavy-trail t)
  :bind
  ("C-c C-b" . nyan-mode))

;; Modeline 
;(defun ntf/mode-line-format (left right)
;  "Return a string of `window-width' length.
;Containing LEFT, and RIGHT aligned respectively."
;  (let ((available-width (- (window-width) (length left) 1)))
;    (format (format "%%s %%%ds " available-width) left right)))
;
;(defface evil-mode-line-face '((t (:foreground  "black"
;                                                  :background "orange")))
;    "Face for evil mode-line colors.")
;
;(setq-default
;   mode-line-format
;   '((:eval (ntf/mode-line-format
;             ;; left portion
;             (format-mode-line
;              (quote ("%e"
;                      (:eval
;                       (when (bound-and-true-p evil-local-mode)
;                         (propertize
;                          (concat
;                           " "
;                           (upcase
;                            (substring (symbol-name evil-state) 0 1))
;                           (substring (symbol-name evil-state) 1)
;                           " ") 'face 'evil-mode-line-face)))
;                      " " (:eval (when (buffer-modified-p) "[+]"))
;                      " " mode-line-buffer-identification
;                      " %l:%c")))
;             ;; right portion
;             (format-mode-line (quote ("%m " (vc-mode vc-mode))))))))

; GDB layout
(setq gdb-many-windows nil)

(defun set-gdb-layout(&optional c-buffer)
  (if (not c-buffer)
      (setq c-buffer (window-buffer (selected-window)))) ;; save current buffer

  ;; from http://stackoverflow.com/q/39762833/846686
  (set-window-dedicated-p (selected-window) nil) ;; unset dedicate state if needed
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows) ;; clean all

  (let* (
         (w-source (selected-window)) ;; left top
         (w-gdb (split-window w-source nil 'right)) ;; right bottom
         (w-locals (split-window w-gdb nil 'above)) ;; right middle bottom
         (w-stack (split-window w-locals nil 'above)) ;; right middle top
         (w-breakpoints (split-window w-stack nil 'above)) ;; right top
         (w-io (split-window w-source (floor(* 0.9 (window-body-height)))
                             'below)) ;; left bottom
         )
    (set-window-buffer w-io (gdb-get-buffer-create 'gdb-inferior-io))
    (set-window-dedicated-p w-io t)
    (set-window-buffer w-breakpoints (gdb-get-buffer-create 'gdb-breakpoints-buffer))
    (set-window-dedicated-p w-breakpoints t)
    (set-window-buffer w-locals (gdb-get-buffer-create 'gdb-locals-buffer))
    (set-window-dedicated-p w-locals t)
    (set-window-buffer w-stack (gdb-get-buffer-create 'gdb-stack-buffer))
    (set-window-dedicated-p w-stack t)

    (set-window-buffer w-gdb gud-comint-buffer)

    (select-window w-source)
    (set-window-buffer w-source c-buffer)
    ))
(defadvice gdb (around args activate)
  "Change the way to gdb works."
  (setq global-config-editing (current-window-configuration)) ;; to restore: (set-window-configuration c-editing)
  (let (
        (c-buffer (window-buffer (selected-window))) ;; save current buffer
        )
    ad-do-it
    (set-gdb-layout c-buffer))
  )
(defadvice gdb-reset (around args activate)
  "Change the way to gdb exit."
  ad-do-it
  (set-window-configuration global-config-editing))

;; centaur tabs
(use-package! centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-style "wave")
  (setq centaur-tabs-set-bar 'under)
  (setq centaur-tabs-gray-out-icons 'buffer)
  (setq centaur-tabs-set-close-button nil)
  :hook
  (dired-mode . centaur-tabs-local-mode)
  :bind
  (:map evil-normal-state-map
        ("C-c f" . centaur-tabs-forward)
        ("C-c b" . centaur-tabs-backward)))

(defun centaur-tabs-hide-tab (x)
  "Do no to show buffer X in tabs."
  (let ((name (format "%s" x)))
    (or
     ;; Current window is not dedicated window.
     (window-dedicated-p (selected-window))

     ;; Buffer name not match below blacklist.
     (string-prefix-p "*epc" name)
     (string-prefix-p "*helm" name)
     (string-prefix-p "*Helm" name)
     (string-prefix-p "*Compile-Log*" name)
     (string-prefix-p "*lsp" name)
     (string-prefix-p "*company" name)
     (string-prefix-p "*Flycheck" name)
     (string-prefix-p "*tramp" name)
     (string-prefix-p " *Mini" name)
     (string-prefix-p "*help" name)
     (string-prefix-p "*straight" name)
     (string-prefix-p " *temp" name)
     (string-prefix-p "*Help" name)
     (string-prefix-p "*mybuf" name)
     (string-prefix-p "*scratch" name)
     (string-prefix-p "*Messages" name)
     (string-prefix-p "*Native-compile-log" name)
     (string-prefix-p "*doom" name)

     ;; Is not magit buffer.
     (and (string-prefix-p "magit" name)
          (not (file-name-extension name)))
     )))
