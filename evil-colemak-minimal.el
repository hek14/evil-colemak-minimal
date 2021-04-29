;;; evil-colemak-minimal.el --- Minimal Colemak key bindings for evil-mode

;; Author: Bryan Allred <bryan@revolvingcow.com>
;; Version: 1.1.0
;; Package-Requires: ((emacs "24") (evil "1.2.12"))
;; Keywords: colemak evil
;; URL: https://github.com/bmallred/evil-colemak-minimal
;;
;; This file is not part of GNU Emacs.

;;; License:

;; Licensed under the same terms as Emacs.

;;; Commentary:

;; This package provides minimal key rebindings for evil-mode with the
;; Colemak keyboard layout.  See the README for more information.
;;
;; To enable globally, use:
;;
;;   (global-evil-colemak-minimal-mode)
;;
;; To enable for just a single buffer, use:
;;
;;   (evil-colemak-minimal-mode)

;;; Code:

(require 'evil)

;;;###autoload
(define-minor-mode evil-colemak-minimal-mode
  "Minor mode with evil-mode enhancements for the Colemak keyboard layout."
  :keymap (make-sparse-keymap)
  :lighter " colemak")

;;;###autoload
(define-globalized-minor-mode global-evil-colemak-minimal-mode
  evil-colemak-minimal-mode
  (lambda () (evil-colemak-minimal-mode t))
  "Global minor mode with evil-mode enhancements for the Colemak keyboard layout.")

;; Helper functions to set maps
(defun evil-colemak-minimal-set-for-all (key def &optional maps)
  "Binds keymaps to all states or only those provided.

KEY is the key, or key chord, to bind
DEF is the defined function to execute
MAPS (optional) is a list of states to bind to"
  (unless maps
    (setq maps (list 'normal
                     'visual
                     'insert
                     'motion)))
  (while maps
    (evil-define-minor-mode-key (pop maps) 'evil-colemak-minimal-mode key def)))

(evil-colemak-minimal-set-for-all "h" 'evil-backward-char '(normal visual motion))
(evil-colemak-minimal-set-for-all "n" 'evil-next-line '(normal visual motion))
(evil-colemak-minimal-set-for-all "e" 'evil-previous-line '(normal visual motion))
(evil-colemak-minimal-set-for-all "i" 'evil-forward-char '(normal visual motion))
(evil-colemak-minimal-set-for-all "l" 'evil-undo '(normal visual motion))
(evil-colemak-minimal-set-for-all "u" 'evil-insert '(normal motion))
(evil-colemak-minimal-set-for-all "u" evil-inner-text-objects-map '(visual operator))
(evil-colemak-minimal-set-for-all "k" 'evil-ex-search-next '(normal visual motion))
(evil-colemak-minimal-set-for-all "K" 'evil-ex-search-previous '(normal visual motion))
(evil-colemak-minimal-set-for-all "U" 'evil-insert-line '(normal visual motion))

;; Window handling
;; C-w (not C-r as in Shai's mappings) prefixes window commands
(define-key evil-window-map "h" 'evil-window-left)
(define-key evil-window-map "H" 'evil-window-move-far-left)
(define-key evil-window-map "n" 'evil-window-down)
(define-key evil-window-map "N" 'evil-window-move-very-bottom)
(define-key evil-window-map "e" 'evil-window-up)
(define-key evil-window-map "E" 'evil-window-move-very-top)
(define-key evil-window-map "i" 'evil-window-right)
(define-key evil-window-map "I" 'evil-window-move-far-right)

(provide 'evil-colemak-minimal)

;;; evil-colemak-minimal.el ends here
