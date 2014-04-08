;; follow symbolic links, don't ask
(setq vc-follow-symlinks t)

;; ansi-term
(global-set-key "\C-x\ t" '(lambda ()(interactive)(ansi-term "/bin/zsh")))

;; no new lines at the end
(setq next-line-add-newlines nil)

;; disable menu bar mode
(menu-bar-mode -1)

;; disable backup
(setq backup-inhibited t)
(setq make-backup-files nil)

;; default column width
(setq-default fill-column 80)

;; set text mode as default
(setq default-major-mode 'text-mode)

;; don't ask for 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; ERC - don't show any of this
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))
