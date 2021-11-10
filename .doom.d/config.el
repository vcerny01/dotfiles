;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Vít Černý"
      user-mail-address "vit.cerny1@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;n; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)


;; Here are some additional functions/macros that could help you configure Doom:
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
;; This will open documentation for it, including demos of how they are used.
;;
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; APPEREANCE
;; start fullscreen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; modern cursor
(setq-default cursor-type 'bar)
(edt-set-scroll-margins "20%" "25%")

;; better buffer list
(defalias 'list-buffers 'ibuffer-other-window)

;; USE TABS INSTEAD OF SPACES
; Yes why, I use tabs and not spaces
(setq indent-tabs-mode 't)
(setq-default tab-width 4)
;; had to disable, python doesnt go well with tabs

;;BETTER SEARCH
(use-package! swiper
:config
(progn
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (global-set-key "\C-s" 'swiper)))

(use-package! avy
:bind ("M-s" . avy-goto-word-1))


(use-package! company-quickhelp
:config
(company-quickhelp-mode))

;; BETTER FONTS
;;(setq doom-font (font-spec :family "JetBrains Mono" :size 13))
(add-to-list 'default-frame-alist '(font . "JetBrains Mono-9"))

;;
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

;; add projectile projects
(setq projectile-project-search-path '("~/Repos/" "~/Study/"))

;; ligatures
;;(use-package! ligature
;;  :load-path "/home/vcerny/.doom.d/"
;;  :config
;; Enable all JetBrains Mono ligatures in programming modes
;;  (ligature-set-ligatures 'prog-mode '("-|" "-~" "---" "-<<" "-<" "--" "->" "->>" "-->" "///" "/=" "/=="
;;                                      "/>" "//" "/*" "*>" "***" "*/" "<-" "<<-" "<=>" "<=" "<|" "<||"
;;                                     "<|||" "<|>" "<:" "<>" "<-<" "<<<" "<==" "<<=" "<=<" "<==>" "<-|"
;;                                    "<<" "<~>" "<=|" "<~~" "<~" "<$>" "<$" "<+>" "<+" "</>" "</" "<*"
;;                                   "<*>" "<->" "<!--" ":>" ":<" ":::" "::" ":?" ":?>" ":=" "::=" "=>>"
;;                                   "==>" "=/=" "=!=" "=>" "===" "=:=" "==" "!==" "!!" "!=" ">]" ">:"
;;                                      ">>-" ">>=" ">=>" ">>>" ">-" ">=" "&&&" "&&" "|||>" "||>" "|>" "|]"
;;                                      "|}" "|=>" "|->" "|=" "||-" "|-" "||=" "||" ".." ".?" ".=" ".-" "..<"
;;                                     "..." "+++" "+>" "++" "[||]" "[<" "[|" "{|" "??" "?." "?=" "?:" "##"
;;                                      "###" "####" "#[" "#{" "#=" "#!" "#:" "#_(" "#_" "#?" "#(" ";;" "_|_"
;;                                      "__" "~~" "~~>" "~>" "~-" "~@" "$>" "^=" "]#"))
;; Enables ligature checks globally in all buffers. You can also do it
;; per mode with `ligature-mode'.
                                        ;(global-ligature-mode t))

;; cannot use it now, breaks major modes for some langs

;; BETTER SCROLLING

(use-package! fast-scroll
  :config
  (fast-scroll-config)
  (fast-scroll-mode 1)
  )

;; get centered cursor without the laggy package
;(setq maximum-scroll-margin 0.5
;        scroll-margin 99999
;        scroll-preserve-screen-position t
;        scroll-conservatively 0)


;; CALENDAR
;; czech things
;;
;;(calendar-set-date-style 'european)

(setq calendar-week-start-day 1
	  calendar-day-name-array

["neděle" "pondělí" "úterý" "středa"
	   "čtvrtek" "pátek" "sobota"]
	  calendar-month-name-array
	  ["leden" "únor" "březen" "duben" "květen"
	   "červen" "červenec" "srpen" "září"
	   "říjen" "listopad" "prosinec"])

;;(czech-holidays-add)

;; holidays I don't care about
(setq holiday-hebrew-holidays nil)
(setq holiday-islamic-holidays nil)
(setq holiday-oriental-holidays nil)
(setq holiday-bahai-holidays nil)



;; ORG MODE
;; fix currently broken org capture in doom
;; and some other org configuration
;(use-package! org
;  :defer t
;  :config
;  (defalias '+org--restart-mode-h #'ignore)
;  (setq org-hide-emphasis-markers t)
;  (setq org-image-actual-width 100)
;  )
;; ORG-HABIT
;(with-eval-after-load 'org
;  (add-to-list 'org-modules 'org-habit t))
;(setq org-todo-keywords
;      '((sequence "TODO(t!)" "NEXT(n)" "SOMEDAY(s)" "|" "DONE(d!)" "CANC(c!)")))
;(setq org-treat-insert-todo-heading-as-state-change t)
;(setq org-log-into-drawer t)

;; ORG-CONTACTS
;;(use-package org-contacts
;;  :after org
;;  :custom (org-contacts-files '("~/org/contacts.org")))


;; drag and drop for org-mode
;(use-package! org-download
;  :init
  ;; Add handlers for drag-and-drop when Org is loaded.
;  (with-eval-after-load 'org
;    (org-download-enable))
;  (setq-default org-download-image-dir "~/org/images/2021"))


;; ORG-CAPTURE
; (after! org
;  (setq
;	org-capture-templates
;	'(
;	  ; other entries here
;	  ("t" "tasks" entry
;	   (file+olp+datetree "journal.org")
;	   "* TODO %?\n%U"))))

;; ORG-JOURNAL
;(use-package! org-journal
;  :custom
;  (org-journal-dir "~/org/journal")
;  (org-journal-file-format "%Y-%m-%d.org")
;  (setq org-journal-enable-agenda-integration t)
;  (org-journal-date-prefix "#+TITLE: "))

;; WEB MODE
(use-package! web-mode
  :config (setq web-mode-enable-current-element-highlight t)
  )

;; LILYPOND
;;(require 'lilypond-mode)

;; PYTHON
;; jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; CLOJURE
;; parinfiner
(use-package! parinfer-rust-mode
  :hook
  emacs-lisp-mode
  clojure-mode
  lisp-mode
  )

 (setq max-specpdl-size 13000)
