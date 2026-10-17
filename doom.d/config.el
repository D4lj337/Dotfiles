;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
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
(setq doom-theme 'mini-midnight)
;; Specify both a dark and light theme, like so and Doom will choose which one
;; to load based on your system light/dark setting:
;;
;;   (setq doom-theme '(doom-one   . doom-one-light))   ; (DARK . LIGHT)
;;
;; If you want more pro-active theme switching based on OS light/dark mode, look
;; up the `auto-dark' package.

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
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

;; Emacs security settings
;; https://www.jamescherti.com/emacs-security-settings/
(setq gnutls-verify-error t)
(setq tls-checktrust t)
(setq gnutls-min-prime-bits 3072)
(setq ffap-machine-p-known 'reject)
(setq package-review-policy t)

;; Detect your CPU architecture
(setq my-cpu-architecture "znver1")  ;; Change to your architecture from: gcc -march=native -Q --help=target | grep march

(setq native-comp-compiler-options
      `(;; Use -O2, NOT -O3 (safer, less aggressive)
        "-O2"
        ,(format "-mtune=%s" my-cpu-architecture)
        ,(format "-march=%s" my-cpu-architecture)
        ;; Reduce .eln file size
        "-g0"
        ;; Recommended by Emacs developers for stability
        "-fno-omit-frame-pointer"
        "-fno-finite-math-only"))

(setq native-comp-driver-options
      '("-Wl,-z,pack-relative-relocs"
        "-Wl,-O2"
        "-Wl,--as-needed"))

(when (string= (system-name) "WarMachine")
  (setq native-comp-speed 3)
  (setq native-comp-compiler-options '("-march=znver1" "-Ofast" "-g0" "-fno-finite-math-only" "-fgraphite-identity" "-floop-nest-optimize" "-fdevirtualize-at-ltrans" "-fipa-pta" "-fno-semantic-interposition" "-flto=auto" "-fuse-linker-plugin"))
  (setq native-comp-driver-options '("-march=znver1" "-Ofast" "-g0" "-fno-finite-math-only" "-fgraphite-identity" "-floop-nest-optimize" "-fdevirtualize-at-ltrans" "-fipa-pta" "-fno-semantic-interposition" "-flto=auto" "-fuse-linker-plugin"))
  (native-compile-async "/usr/local/lib/emacs/31.0.50/native-lisp" 'recursively)
  (custom-set-faces
   '(default ((t (:family "JetBrains Mono" :height 110))))
   '(variable-pitch ((t (:family "Linux Libertine" :height 90))))
   '(fixed-pitch ((t (:family "JetBrains Mono" :height 100))))))

(when (string= (system-name) "Tiffany")
  (setq doom-modeline-height 20)
  (setq display-battery-mode nil)
  (setq native-comp-speed 3)
  (setq native-comp-compiler-options '("-march=znver3" "-Ofast" "-g0" "-fno-finite-math-only" "-fgraphite-identity" "-floop-nest-optimize" "-fdevirtualize-at-ltrans" "-fipa-pta" "-fno-semantic-interposition" "-flto=auto" "-fuse-linker-plugin"))
  (setq native-comp-driver-options '("-march=znver3" "-Ofast" "-g0" "-fno-finite-math-only" "-fgraphite-identity" "-floop-nest-optimize" "-fdevirtualize-at-ltrans" "-fipa-pta" "-fno-semantic-interposition" "-flto=auto" "-fuse-linker-plugin"))
  (native-compile-async "/usr/lib/emacs/30.2/native-lisp" 'recursively)
  (custom-set-faces
   '(default ((t (:family "JetBrains Mono" :height 90))))
   '(variable-pitch ((t (:family "Linux Libertine" :height 80))))
   '(fixed-pitch ((t (:family "JetBrains Mono" :height 80))))))

(defun my-auto-open-external ()
  "Auto-open media/image files with external programs."
  (let* ((file (buffer-file-name))
         (ext (file-name-extension file)))
    (when ext
      (setq ext (downcase ext))
      (cond
        ((member ext '("mkv" "mp4" "avi" "mov" "webm" "flv" "m4v" "mpg" "mpeg"))
         (start-process "mpv" nil "mpv" file)
         (kill-buffer (current-buffer)))
        ((member ext '("jpg" "jpeg" "png" "gif" "webp" "bmp" "svg"))
         (start-process "feh" nil "feh" file)
         (kill-buffer (current-buffer)))))))

(add-hook 'find-file-hook #'my-auto-open-external)

;; -*- Zen mode
(defun my/zen-mode ()
  "Toggle Olivetti mode with additional distraction-free settings."
  (interactive)
  (if olivetti-mode
      (progn
        (olivetti-mode 0)
        (display-line-numbers-mode 1)
        (message "Zen Mode disbaled"))  ;; Re-enable line numbers
    (progn
      (olivetti-mode 1)
      (display-line-numbers-mode -1)
      (message "Zen Mode enabled")))) ;; Disable line numbers

(defun my/tangle-config-org-on-save ()
  "Automatically tangle config.org after saving, with longlines-mode disabled."
  (when (string-equal (buffer-file-name)
                    (expand-file-name "config.org" user-emacs-directory))
;    (longlines-mode -1)
    (org-babel-tangle)
    (message "Tangling completed")))

(add-hook 'after-save-hook #'my/tangle-config-org-on-save)

;; -*- lexical-binding: t; -*-
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

(defun my/insert-comment ()
  "Insert a comment with language-specific syntax."
  (interactive)
  (comment-dwim nil))

;; Configure vundo settings using Doom's setq!
(setq! diff-switches "-u --color=never"
       vundo-glyph-alist vundo-unicode-symbols
       vundo-compact-display t
       vundo-window-max-height 8
       vundo-glyph-alist vundo-unicode-symbols)

;; Set up your keybinding (Doom uses `map!` instead of :bind)
(map! "C-x u" #'vundo)

;; Battery
(display-time-mode 1)
(display-battery-mode 1)

(use-package! mini-essays
  :commands (mini-essays-setup
             mini-essays-setup-auto-insert)
  :custom
  (mini-essays-max-chars 3000)
  ;; (mini-essays-fill-column 100)
  :init
  (add-hook 'org-mode-hook #'mini-essays-setup)
  :config
  (mini-essays-setup-auto-insert))

;;; Org
(use-package! org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  :commands (org-agenda org-capture)

  :custom
  (org-agenda-files '("~/Documents/org/"))
  (org-log-done 'time)

  ;; Appearance
  (org-hide-emphasis-markers t)
  (org-hide-leading-stars t)
  (org-ellipsis "  .")

  ;; Source blocks
  (org-src-fontify-natively t)
  (org-src-tab-acts-natively t)
  (org-edit-src-content-indentation 0)

  ;; Lists / headlines
  (org-cycle-separator-lines 1)
  (org-fontify-whole-heading-line t)
  (org-fontify-done-headline t)
  (org-fontify-quote-and-verse-blocks t)

  ;; Pretty entities
  (org-pretty-entities t)

  :hook
  (org-mode . my/force-org-font-lock))

(defun my/force-org-font-lock ()
  "Force font-lock to apply to the whole buffer."
  (font-lock-ensure))


;; Better list bullets
(font-lock-add-keywords
 'org-mode
 '(("^ *\\([-]\\) "
    (0 (prog1 ()
         (compose-region
          (match-beginning 1)
          (match-end 1)
          "•"))))))


;; Change list bullet when indenting
(setq org-list-demote-modify-bullet
      '(("+" . "-")
        ("-" . "+")
        ("*" . "+")))

;; Org Babel
(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     (lisp . t)
     (shell . t)
     (R . t)
     (lua . t)
     (calc . t)
     (sql . t))))

(custom-set-faces!
  '(variable-pitch :family "Linux Libertine" :height 90)
  '(fixed-pitch :family "JetBrains Mono" :height 90)

    '(org-block :inherit fixed-pitch)
  '(org-code :inherit (shadow fixed-pitch))
  '(org-table :inherit fixed-pitch)
  '(org-verbatim :inherit (shadow fixed-pitch))
  '(org-special-keyword :inherit (font-lock-comment-face fixed-pitch))
  '(org-meta-line :inherit (font-lock-comment-face fixed-pitch))
  '(org-checkbox :inherit fixed-pitch))

;; M-x compile
(defun compile-and-run-current-file ()
  "Compile or run the current file depending on its extension."
  (interactive)
  (let* ((file (shell-quote-argument (buffer-file-name)))
         (ext (file-name-extension file))
         (cmd
          (cond
           ((member ext '("c"))
            (format "gcc %s -o /tmp/a.out && /tmp/a.out" file))
           ((member ext '("asm" "s"))
            (format "nasm -f elf64 %s -o /tmp/a.o && ld /tmp/a.o -o /tmp/a.out && /tmp/a.out" file))
           ((member ext '("py"))
            (format "python3 %s" file))
           ((member ext '("lua"))
            (format "lua %s" file))
           ((member ext '("go"))
            (format "go run %s" file))
           (t (format "chmod +x %s && %s" file file)))))
    (compilation-start cmd)))

 (add-to-list 'display-buffer-alist
              '("\\*compilation\\*"
                (display-buffer-reuse-window display-buffer-at-bottom)
                (window-height . 0.4)))

(global-set-key (kbd "C-c r") 'compile-and-run-current-file)

(use-package whisper
    :bind ("C-H-r" . whisper-run)
  :config
  (setopt whisper-install-directory (expand-file-name "whisper" user-emacs-directory)
          whisper-model "base"
          whisper-language "en"
          whisper-translate nil
          whisper-cursor-return 'start
          whisper-insert-text-at-point nil
          whisper-use-threads (/ (num-processors) 2)))

(use-package xdg-launcher
    :demand t)
