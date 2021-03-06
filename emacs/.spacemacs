;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     coq
     haskell
     auto-completion
     better-defaults
     emacs-lisp
     git
     org
     emoji
     html
     latex
     syntax-checking
     ess
     spacemacs-ui
     spacemacs-ui-visual
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'
   dotspacemacs-additional-packages
   '(
     all-the-icons
     key-chord
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(noctilux)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Consolas"
                               :size 24
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  ;; =========== keymapping ====================================================
  ;; control window move using alt
  ;; normal state
  (define-key evil-normal-state-map (kbd "M-k") 'windmove-up)
  (define-key evil-normal-state-map (kbd "M-j") 'windmove-down)
  (define-key evil-normal-state-map (kbd "M-h") 'windmove-left)
  (define-key evil-normal-state-map (kbd "M-l") 'windmove-right)
  ;; insert state
  (define-key evil-insert-state-map (kbd "M-k") 'windmove-up)
  (define-key evil-insert-state-map (kbd "M-j") 'windmove-down)
  (define-key evil-insert-state-map (kbd "M-h") 'windmove-left)
  (define-key evil-insert-state-map (kbd "M-l") 'windmove-right)

  ;; delete without register
  (evil-define-operator evil-delete-without-register (beg end type yank-handler)
    (interactive "<R><y>")
    (evil-delete beg end type ?_ yank-handler))
  (define-key evil-normal-state-map (kbd "d") 'evil-delete-without-register)
  (define-key evil-visual-state-map (kbd "d") 'evil-delete-without-register)
  (define-key evil-normal-state-map (kbd "D") 'evil-delete)
  (define-key evil-visual-state-map (kbd "D") 'evil-delete)

  ;;Exit insert mode by pressing j and then j quickly
  (setq key-chord-two-keys-delay 1)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "kk" 'evil-normal-state)
  (key-chord-mode 1)

  ;; use control-c and control-v to copy and paste
  (define-key evil-insert-state-map (kbd "C-v") 'evil-paste-after)
  (define-key evil-visual-state-map (kbd "C-c") 'evil-yank)
  (define-key evil-insert-state-map (kbd "C-z") 'undo)
  (define-key evil-normal-state-map (kbd "C-z") 'undo)

  ;; use `;' to go to the end of the line
  (define-key evil-motion-state-map (kbd ";") 'evil-end-of-line)

  ;; use c-j k h l to navigate in insert mode
  (define-key evil-insert-state-map (kbd "C-l") 'evil-forward-char)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-backward-char)
  (define-key evil-insert-state-map (kbd "C-j") 'evil-next-line)
  (define-key evil-insert-state-map (kbd "C-k") 'evil-previous-line)

  ;;use C-s to save
  (define-key evil-insert-state-map (kbd "C-s") 'evil-write)
  (define-key evil-normal-state-map (kbd "C-s") 'evil-write)
  (define-key evil-visual-state-map (kbd "C-s") 'evil-write)

  ;; use C-enter to make new line
  (define-key evil-insert-state-map (kbd "<C-return>") 'evil-open-below)

  ;; use C-i to expand snippets
  (define-key yas-minor-mode-map (kbd "C-i") 'yas-expand)

  ;; behave xterm
  (xterm-mouse-mode t)

  ;; scroll one line at a time (less "jumpy" than defaults)
  (setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; one line at a time
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
  (setq scroll-step 1) ;; keyboard scroll one line at a time

  ;; automatically save buffers associated with files on buffer switch
  ;; and on windows switch
  (defadvice switch-to-buffer (before save-buffer-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice other-window (before other-window-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice windmove-up (before other-window-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice windmove-down (before other-window-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice windmove-left (before other-window-now activate)
    (when buffer-file-name (save-buffer)))
  (defadvice windmove-right (before other-window-now activate)
    (when buffer-file-name (save-buffer)))

  ;; ============ configure packages ========================================

  ;; neotree section
  ;; use icons for neotree
  (setq neo-theme (if window-system 'icons 'arrow))

  ;; org section
  ;; enable github support
  (setq-default dotspacemacs-configuration-layers
                '((org :variables org-enable-github-support t)))
  ;; enable pretty entity
  (setq-default org-pretty-entities t)
  ;; set the bullets list, the flower hurt my eyes...
  (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
  ;; set org-reveal root
  (setq org-reveal-root "file:///C:/Users/zcsxo/GithubRepo/reveal.js")
  ;; set company org mode
  (defun org-keyword-backend (command &optional arg &rest ignored)
    (interactive (list 'interactive))
    (cl-case command
      (interactive (company-begin-backend 'org-keyword-backend))
      (prefix (and (eq major-mode 'org-mode)
                   (cons (company-grab-line "^#\\+\\(\\w*\\)" 1)
                         t)))
      (candidates (mapcar #'upcase
                          (cl-remove-if-not
                           (lambda (c) (string-prefix-p arg c))
                           (pcomplete-completions))))
      (ignore-case t)
      (duplicates t)))

  ;; markdown section
  ;; use markdown-it as markdown compiler
  (custom-set-variables
   '(markdown-command "pandoc"))


  ;; autocomplete section
  ;; enable global autocomplete
  (global-company-mode)
  ;; set math symbol to be global
  (add-to-list 'company-backends 'company-math-symbols-unicode)
  ;; let snippets to appear in completion popup
  (setq-default dotspacemacs-configuration-layers
                '((auto-completion :variables
                                   auto-completion-enable-snippets-in-popup t)))
  ;; enable auto-tooltip
  (setq-default dotspacemacs-configuration-layers
                '((auto-completion :variables
                                   auto-completion-enable-help-tooltip t)))
  ;; sort result by usage
  (setq-default dotspacemacs-configuration-layers
                '((auto-completion :variables
                                   auto-completion-enable-sort-by-usage t)))

)

;; do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (winum unfill fuzzy memoize intero flycheck-haskell company-ghci company-ghc ghc hlint-refactor hindent helm-hoogle haskell-snippets haskell-mode company-cabal cmm-mode company-coq company-math math-symbol-lists hide-comnt key-chord web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode all-the-icons font-lock+ vimrc-mode dactyl-mode xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme pandoc-mode ox-pandoc ht organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic yaml-mode company-auctex auctex-latexmk emoji-cheat-sheet-plus company-emoji ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline powerline smeargle restart-emacs rainbow-delimiters powershell popwin persp-mode pcre2el paradox spinner orgit org-projectile org-present org org-pomodoro alert log4e gntp org-plus-contrib org-download org-bullets open-junk-file neotree mwim move-text mmm-mode markdown-toc markdown-mode magit-gitflow macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-gitignore request helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck pkg-info epl flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode elisp-slime-nav dumb-jump f s diminish diff-hl define-word company-statistics company column-enforce-mode clean-aindent-mode bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed dash auctex aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup quelpa package-build noctilux-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
