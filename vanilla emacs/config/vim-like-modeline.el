(defun ntf/mode-line-format (left right)
  "Return a string of `window-width' length.
Containing LEFT, and RIGHT aligned respectively."
  (let ((available-width (- (window-width) (length left) 1)))
    (format (format "%%s %%%ds " available-width) left right)))

(defface evil-mode-line-face '((t (:foreground  "black"
                                                  :background "orange")))
    "Face for evil mode-line colors.")

(setq-default
   mode-line-format
   '((:eval (ntf/mode-line-format
             ;; left portion
             (format-mode-line
              (quote ("%e"
                      (:eval
                       (when (bound-and-true-p evil-local-mode)
                         (propertize
                          (concat
                           " "
                           (upcase
                            (substring (symbol-name evil-state) 0 1))
                           (substring (symbol-name evil-state) 1)
                           " ") 'face 'evil-mode-line-face)))
                      " " (:eval (when (buffer-modified-p) "[+]"))
                      " " mode-line-buffer-identification
                      " %l:%c")))
             ;; right portion
             (format-mode-line (quote ("%m " (vc-mode vc-mode))))))))
