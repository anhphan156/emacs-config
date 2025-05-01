(provide 'module1)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq inhibit-startup-message t)

(set-face-attribute 'default nil :height 140)

(display-line-numbers-mode)
(setq display-line-numbers 'relative)

(require 'kanagawa-themes)
(load-theme 'kanagawa-wave t)

(require 'doom-modeline)
(doom-modeline-mode 1)

(require 'evil)
(evil-mode 1)

(require 'haskell-mode-autoloads)
