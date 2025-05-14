(provide 'module1)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq inhibit-startup-message t)

(set-face-attribute 'default nil :height 140)

(require 'kanagawa-themes)
(load-theme 'kanagawa-wave t)

(global-display-line-numbers-mode)
(setq display-line-numbers 'relative)
(set-face-attribute 'line-number-current-line nil
                    :foreground "#F7EBE8"
                    :background "#E54B4B"
                    :weight 'bold)
(set-face-attribute 'line-number nil
                    :background (face-attribute 'default :background))


(require 'doom-modeline)
(doom-modeline-mode 1)

(require 'evil)
(evil-mode 1)

(require 'haskell-mode-autoloads)
